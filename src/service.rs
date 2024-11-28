use crate::model::{Adresse, Coordonnee, Stationnement};
use actix_web::{get, patch, web, HttpResponse, Responder};
use serde_json::json;
use sqlx::MySqlPool;

#[get("/stationnements")]
pub async fn get_stationnements(pool: web::Data<MySqlPool>) -> impl Responder {
    // Mapping manually to nested struct using SQLx
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
                    heures_dispo: row.heures_dispo,
                    date_dispo: row.date_dispo,
                })
                .collect();

            HttpResponse::Ok().json(stationnements)
        }
        Err(e) => {
            eprintln!("Error fetching stationnements: {}", e);
            HttpResponse::InternalServerError().json(json!({
                "error": "Failed to fetch stationnements"
            }))
        }
    }
}
