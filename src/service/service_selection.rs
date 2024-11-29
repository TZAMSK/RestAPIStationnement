use actix_web::{get, web, HttpResponse, Responder};
use serde_json::json;
use sqlx::MySqlPool;

#[get("/stationnements/numeros_municipaux")]
pub async fn get_numeros_municipaux(pool: web::Data<MySqlPool>) -> impl Responder {
    let rows = sqlx::query!(
        r#"
        SELECT DISTINCT
            numero_municipal
        FROM stationnements
        "#,
    )
    .fetch_all(pool.get_ref())
    .await;

    match rows {
        Ok(rows) => {
            let numeros_municipaux: Vec<String> =
                rows.into_iter().map(|row| row.numero_municipal).collect();
            HttpResponse::Ok().json(numeros_municipaux)
        }
        Err(e) => {
            eprintln!(
                "Erreur d'aller chercher les numeros municipaux uniques: {}",
                e
            );
            HttpResponse::InternalServerError().json(json!( {
                "Erreur": "Erreur de recherche numeros municipaux uniques"
            }))
        }
    }
}

#[get("/stationnements/rues")]
pub async fn get_rues(pool: web::Data<MySqlPool>) -> impl Responder {
    let rows = sqlx::query!(
        r#"
        SELECT DISTINCT
            rue
        FROM stationnements
        "#,
    )
    .fetch_all(pool.get_ref())
    .await;

    match rows {
        Ok(rows) => {
            let rues: Vec<String> = rows.into_iter().map(|row| row.rue).collect();
            HttpResponse::Ok().json(rues)
        }
        Err(e) => {
            eprintln!("Erreur d'aller chercher les rues uniques: {}", e);
            HttpResponse::InternalServerError().json(json!( {
                "Erreur": "Erreur de recherche rues uniques"
            }))
        }
    }
}

#[get("/stationnements/codes_postals")]
pub async fn get_codes_postals(pool: web::Data<MySqlPool>) -> impl Responder {
    let rows = sqlx::query!(
        r#"
        SELECT DISTINCT
            code_postal
        FROM stationnements
        "#,
    )
    .fetch_all(pool.get_ref())
    .await;

    match rows {
        Ok(rows) => {
            let codes_postaux: Vec<String> = rows.into_iter().map(|row| row.code_postal).collect();
            HttpResponse::Ok().json(codes_postaux)
        }
        Err(e) => {
            eprintln!("Erreur d'aller chercher les codes postaux uniques: {}", e);
            HttpResponse::InternalServerError().json(json!( {
                "Erreur": "Erreur de recherche codes postaux uniques"
            }))
        }
    }
}