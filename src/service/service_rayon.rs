use crate::modele::modele::{Adresse, Coordonnee, Stationnement};
use actix_web::{get, web, HttpResponse, Responder};
use serde_json::json;
use sqlx::MySqlPool;
use std::collections::HashSet;

// Taille en mètre:
// Source: https://support.oxts.com/hc/en-us/articles/115002885125-Level-of-Resolution-of-Longitude-and-Latitude-Measurements
const DISTANCE_UN_DEGRE_KILOMETRE_LONGITUDE: f32 = 111.319;
const DISTANCE_UN_DEGRE_KILOMETRE_LATITUDE: f32 = 110.574;

fn calculer_coordonnees_rayon(
    centre_longitude: f32,
    centre_latitude: f32,
    rayon: f32,
) -> (f32, f32, f32) {
    let rayon_km: f32 = rayon / 1000.0;

    // Formule: https://stackoverflow.com/questions/66177740/producing-points-in-a-circle-with-specific-radius-from-central-lat-long
    let rayon_latitude =
        rayon_km / DISTANCE_UN_DEGRE_KILOMETRE_LATITUDE * centre_longitude.to_radians().cos();
    let rayon_longitude =
        rayon_km / (DISTANCE_UN_DEGRE_KILOMETRE_LONGITUDE * centre_latitude.to_radians().cos());

    println!(
        "Coordonnee rayon (taille): longitude: {}, latitude: {}",
        rayon_longitude, rayon_latitude
    );

    let coordonne_lat_rayon = centre_latitude - rayon_latitude;
    let coordonne_lon_rayon = centre_longitude - rayon_longitude;

    println!(
        "Coordonnee rayon: longitude: {}, latitude: {}",
        coordonne_lon_rayon, coordonne_lat_rayon
    );

    // Distance entre 2 point (taille rayon)
    let distance_x = (centre_longitude - coordonne_lon_rayon).powi(2);
    let distance_y = (centre_latitude - coordonne_lat_rayon).powi(2);
    let taille_rayon = (distance_x + distance_y).sqrt();

    (rayon_latitude, rayon_longitude, taille_rayon)
}

#[get("/stationnements/rayon/{position_longitude}/{position_latitude}/{rayon_metre}")]
pub async fn get_stationnements_rayon(
    path: web::Path<(f64, f64, i32)>,
    pool: web::Data<MySqlPool>,
) -> impl Responder {
    let (position_longitude, position_latitude, rayon_metre) = path.into_inner();

    let centre_longitude = position_longitude as f32;
    let centre_latitude = position_latitude as f32;
    let rayon = rayon_metre as f32;

    let (_, _, taille_rayon) = calculer_coordonnees_rayon(centre_longitude, centre_latitude, rayon);

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
        "#
    )
    .fetch_all(pool.get_ref())
    .await;

    match rows {
        Ok(rows) => {
            let stationnements: Vec<Stationnement> = rows
                .into_iter()
                .filter_map(|row| {
                    let longitude = row.longitude as f32;
                    let latitude = row.latitude as f32;

                    // Source: https://math.stackexchange.com/questions/76457/check-if-a-point-is-within-an-ellipse
                    // Source: https://stackoverflow.com/questions/481144/equation-for-testing-if-a-point-is-inside-a-circle
                    // Comme dans une ellipse, on vérifie si un point est dans un cercle si le
                    // résultat est plus petit que l'aire
                    // Dans une ellipse si plus petit que 1
                    // Pour un cercle: (x - origin.x)^2 + (x - origin.y)^2 = r^2
                    // Ca doit être plus petie que r^2
                    // Mais pour une ellipse, voire le URL (dois etre plus petit que 1 pour être à
                    // l'intérieur, si = 1, sur la bordure)
                    //
                    // (x, y) = (longitude, latitude)
                    let aire = ((centre_longitude - longitude).powi(2))
                        + ((centre_latitude - latitude).powi(2));

                    if aire < taille_rayon.powi(2) {
                        Some(Stationnement {
                            id: row.id.to_string(),
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
                        })
                    } else {
                        None
                    }
                })
                .collect();
            return HttpResponse::Ok().json(stationnements);
        }

        Err(e) => {
            eprint!("Erreur d'aller chercher les stationnements: {}", e);
            return HttpResponse::InternalServerError().json(json!({
                "Erreur": "Erreur de recherche stationnements"
            }));
        }
    }
}

#[get("/stationnements/recherche/rayon/{position_longitude}/{position_latitude}/{rayon_metre}")]
pub async fn get_tous_adresses_rayon(
    path: web::Path<(f64, f64, i32)>,
    pool: web::Data<MySqlPool>,
) -> impl Responder {
    let (position_longitude, position_latitude, rayon_metre) = path.into_inner();

    let centre_longitude = position_longitude as f32;
    let centre_latitude = position_latitude as f32;
    let rayon = rayon_metre as f32;

    let (_, _, taille_rayon) = calculer_coordonnees_rayon(centre_longitude, centre_latitude, rayon);

    let rows = sqlx::query!(
        r#"
        SELECT DISTINCT
            rue,
            latitude,
            longitude
        FROM stationnements
        "#
    )
    .fetch_all(pool.get_ref())
    .await;

    match rows {
        Ok(rows) => {
            let stationnements: Vec<String> = rows
                .into_iter()
                .filter_map(|row| {
                    let longitude = row.longitude as f32;
                    let latitude = row.latitude as f32;
                    let aire = ((centre_longitude - longitude).powi(2))
                        + ((centre_latitude - latitude).powi(2));

                    if aire < taille_rayon.powi(2) {
                        Some(row.rue)
                    } else {
                        None
                    }
                })
                // Source: https://users.rust-lang.org/t/better-way-to-find-unique-values/38966
                .collect::<HashSet<String>>()
                .into_iter()
                .collect::<Vec<String>>();

            let mut ordre_stationnements = stationnements;
            ordre_stationnements.sort();

            return HttpResponse::Ok().json(ordre_stationnements);
        }

        Err(e) => {
            eprint!("Erreur d'aller chercher les stationnements: {}", e);
            return HttpResponse::InternalServerError().json(json!({
                "Erreur": "Erreur de recherche stationnements"
            }));
        }
    }
}
