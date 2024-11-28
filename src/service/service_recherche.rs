use crate::modele::modele::{Adresse, Coordonnee, Stationnement};
use actix_web::{get, web, HttpResponse, Responder};
use serde_json::json;
use sqlx::MySqlPool;

#[get("/stationnements/{numero_municipal}/{rue}/{code_postal}")]
pub async fn get_stationnements_avec_adresse(
    path: web::Path<(String, String, String)>,
    pool: web::Data<MySqlPool>,
) -> impl Responder {
    // Récupérer ce qui a été donné dans les paramètres
    let (numero_municipal, rue, code_postal) = path.into_inner();

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
            heures_fin
        FROM stationnements
        WHERE numero_municipal = ? AND rue = ? AND code_postal = ?
        "#,
        numero_municipal,
        rue,
        code_postal
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
                    panneau: row.panneau.into(),
                    heures_debut: row.heures_debut.to_string(),
                    heures_fin: row.heures_fin.to_string(),
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
