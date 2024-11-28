use crate::modele::modele::{Adresse, Coordonnee, Stationnement};
use actix_web::{get, web, HttpResponse, Responder};
use serde_json::json;
use sqlx::MySqlPool;

#[get("/stationnements")]
pub async fn get_stationnements(pool: web::Data<MySqlPool>) -> impl Responder {
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
            HttpResponse::InternalServerError().json(json!( {
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
    .fetch_one(pool.get_ref())
    .await;

    match row {
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
        Err(e) => {
            eprintln!("Erreur d'aller chercher les stationnements: {}", e);
            HttpResponse::InternalServerError().json(json!( {
                "Erreur": "Erreur de recherche stationnements"
            }))
        }
    }
}
