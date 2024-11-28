use crate::modele::modele::{Adresse, Coordonnee, Stationnement};
use actix_web::{get, web, HttpResponse, Responder};
use chrono::{NaiveTime, Timelike};
use serde_json::json;
use sqlx::MySqlPool;

#[get("/stationnements/{temps_debut}/{temps_prevus}")]
pub async fn get_stationnements_heure(
    path: web::Path<(String, String)>,
    pool: web::Data<MySqlPool>,
) -> impl Responder {
    let (temps_debut_str, temps_prevus_str) = path.into_inner();

    let temps_debut = NaiveTime::parse_from_str(&temps_debut_str, "%H:%M").unwrap();
    let temps_prevus = NaiveTime::parse_from_str(&temps_prevus_str, "%H:%M").unwrap();

    let total_seconds =
        temps_debut.num_seconds_from_midnight() + temps_prevus.num_seconds_from_midnight();
    let temps_final =
        NaiveTime::from_num_seconds_from_midnight_opt(total_seconds % 86400, 0).unwrap();

    let temps_debut_str = temps_debut.format("%H:%M").to_string();
    let temps_final_str = temps_final.format("%H:%M").to_string();

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
            HttpResponse::InternalServerError().json(json!( {
                "Erreur": "Erreur de recherche stationnements"
            }))
        }
    }
}
