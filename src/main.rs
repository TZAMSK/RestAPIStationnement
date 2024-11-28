mod model;
mod service;

use actix_web::{web, App, HttpServer};
use dotenv::dotenv;
use sqlx::mysql::MySqlPoolOptions;
use std::env;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    // Charge les données dans .env
    dotenv().ok();

    // La variable prend la valeur de DATABASE_URL qui est définit dans .env.
    // DATABASE_URL est utilisé pendent le temps de l'execution et non temps de compilation
    // Pour charger la configuration
    let database_url = env::var("DATABASE_URL").expect("DATABASE_URL must be set");

    // Instancier la connexion avec MySQL
    let pool = MySqlPoolOptions::new()
        .max_connections(5)
        .connect(&database_url)
        // Connexion est asynchrone. Donc,
        .await
        .expect("Erreur de la création de la connexion ");

    // Instancier la connexion avec le serveur Actix Web
    HttpServer::new(move || {
        App::new()
            .app_data(web::Data::new(pool.clone()))
            // HTTP:GET TOUS LES STATIONNEMENTS
            // http://localhost:8080/stationnements
            .service(service::get_stationnements)
            // HTTP:GET UN STATIONNEMENT
            // http://localhost:8080/stationnement
            .service(service::get_stationnement)
    })
    // Adresse réseau avec le port 8080
    .bind("localhost:8080")?
    .run()
    .await
}