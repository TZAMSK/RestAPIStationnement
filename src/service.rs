use crate::model::{Adresse, Coordonnee, Stationnement};
use actix_web::{get, web, HttpResponse, Responder};
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
            heures_dispo,
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
                    heures_dispo: row.heures_dispo,
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
            heures_dispo,
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
                heures_dispo: row.heures_dispo,
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
