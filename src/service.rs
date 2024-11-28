use crate::model::{Adresse, Coordonnee, Stationnement};
use actix_web::{get, web, HttpResponse, Responder};
use chrono::{Duration, NaiveDateTime, NaiveTime, Timelike};
use serde_json::json;
use sqlx::MySqlPool;

#[get("/stationnements")]
pub async fn get_stationnements(pool: web::Data<MySqlPool>) -> impl Responder {
    // À la place de faire SELECT * FROM
    // on spécifie les champs parce que la structure de mon modèle Stationnement est imbriqué
    let rows = sqlx::query!(
        r#"
        SELECT
            id,
            numero_municipal,
            rue,
            code_postal,
            longitude,
            latitude,
            panneau,
            heures_debut,
            heures_fin,
            date_dispo
        FROM stationnements
        "#
    )
    // On s'attend à recevoir toutes les lignes
    // donc, all
    .fetch_all(pool.get_ref())
    .await;

    match rows {
        // Si réussi à communiquer
        Ok(rows) => {
            let stationnements: Vec<Stationnement> = rows
                // Avec la règle primère de Rust, into_iter prend possession des données et les
                // met dans stationnements. donc row n'est plus valide
                .into_iter()
                // Transfomer ce qui est dans le vecteurs pour produire un stationnement
                .map(|row| Stationnement {
                    id: row.id,
                    adresse: Adresse {
                        numero_municipal: row.numero_municipal,
                        rue: row.rue,
                        code_postal: row.code_postal,
                    },
                    coordonnee: Coordonnee {
                        longitude: row.longitude,
                        latitude: row.latitude,
                    },
                    panneau: row.panneau,
                    heures_debut: row.heures_debut.to_string(),
                    heures_fin: row.heures_fin.to_string(),
                    date_dispo: row.date_dispo,
                })
                // Collecter les données transformés vers le vecteurs stationnements
                .collect();

            // Si réussi, création de la requête
            HttpResponse::Ok().json(stationnements)
        }
        // Sinon
        Err(e) => {
            eprintln!("Erreur d'aller chercher les stationnements: {}", e);
            HttpResponse::InternalServerError().json(json!({
                "Erreur": "Erreur de recherche stationnements"
            }))
        }
    }
}

#[get("/stationnements/{id}")]
pub async fn get_stationnement(
    path: web::Path<uuid::Uuid>,
    pool: web::Data<MySqlPool>,
) -> impl Responder {
    let stationnement_id = path.into_inner().to_string();
    let row = sqlx::query!(
        r#"
        SELECT
            id,
            numero_municipal,
            rue,
            code_postal,
            longitude,
            latitude,
            panneau,
            heures_debut,
            heures_fin,
            date_dispo
        FROM stationnements
        WHERE id = ?"#,
        stationnement_id
    )
    // On s'attend à recevoir une seule ligne
    .fetch_one(pool.get_ref())
    .await;

    match row {
        // Si réussi à communiquer
        Ok(row) => {
            let stationnement = Stationnement {
                id: row.id,
                adresse: Adresse {
                    numero_municipal: row.numero_municipal,
                    rue: row.rue,
                    code_postal: row.code_postal,
                },
                coordonnee: Coordonnee {
                    longitude: row.longitude,
                    latitude: row.latitude,
                },
                panneau: row.panneau,
                heures_debut: row.heures_debut.to_string(),
                heures_fin: row.heures_fin.to_string(),
                date_dispo: row.date_dispo,
            };

            HttpResponse::Ok().json(stationnement)
        }
        // Sinon
        Err(e) => {
            eprintln!("Erreur d'aller chercher les stationnements: {}", e);
            HttpResponse::InternalServerError().json(json!({
                "Erreur": "Erreur de recherche stationnements"
            }))
        }
    }
}

#[get("/stationnements/{temps_debut}/{temps_prevus}")]
pub async fn get_stationnements_heure(
    path: web::Path<(String, String)>,
    pool: web::Data<MySqlPool>,
) -> impl Responder {
    // Récupérer ce qui a été donné dans les paramètres
    let (temps_debut_str, temps_prevus_str) = path.into_inner();

    // Mettre les chaînes en objet NaiveTime en format Heure:Min
    let temps_debut = NaiveTime::parse_from_str(&temps_debut_str, "%H:%M").unwrap();
    let temps_prevus = NaiveTime::parse_from_str(&temps_prevus_str, "%H:%M").unwrap();

    // On veut les secondes (pour temps final)
    // Donc, on avec la librairie chrono, on peut calculer les secondes de minuit au temps donné
    // On additionne temps debut avec temps prevu pour le temps final attendu
    let total_seconds =
        temps_debut.num_seconds_from_midnight() + temps_prevus.num_seconds_from_midnight();

    let temps_final =
        NaiveTime::from_num_seconds_from_midnight_opt(total_seconds % 86400, 0).unwrap();

    // Formater en Heure:Min (ex: 08:00)
    let temps_debut_str = temps_debut.format("%H:%M").to_string();
    let temps_final_str = temps_final.format("%H:%M").to_string();

    // Query the database for stationnements
    let rows = sqlx::query!(
        r#"
        SELECT
            id,
            numero_municipal,
            rue,
            code_postal,
            longitude,
            latitude,
            panneau,
            heures_debut,
            heures_fin,
            date_dispo
        FROM stationnements
        WHERE heures_debut BETWEEN ? AND ? AND heures_fin BETWEEN ? AND ?;
        "#,
        temps_debut_str,
        temps_final_str,
        temps_debut_str,
        temps_final_str
    )
    .fetch_all(pool.get_ref())
    .await;

    match rows {
        Ok(rows) => {
            let stationnements: Vec<Stationnement> = rows
                .into_iter()
                .map(|row| Stationnement {
                    id: row.id,
                    adresse: Adresse {
                        numero_municipal: row.numero_municipal,
                        rue: row.rue,
                        code_postal: row.code_postal,
                    },
                    coordonnee: Coordonnee {
                        longitude: row.longitude,
                        latitude: row.latitude,
                    },
                    panneau: row.panneau,
                    heures_debut: row.heures_debut.to_string(),
                    heures_fin: row.heures_fin.to_string(),
                    date_dispo: row.date_dispo,
                })
                .collect();

            HttpResponse::Ok().json(stationnements)
        }
        Err(e) => {
            eprintln!("Erreur d'aller chercher les stationnements: {}", e);
            HttpResponse::InternalServerError().json(json!({
                "Erreur": "Erreur de recherche stationnements"
            }))
        }
    }
}
