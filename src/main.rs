//mod model;
mod service {
    pub mod service_affichage;
    pub mod service_filtre;
    pub mod service_image;
    pub mod service_recherche;
}

mod modele {
    pub mod modele;
}

use actix_cors::Cors;
use actix_web::{web, App, HttpServer};
use dotenv::dotenv;
use service::{service_affichage, service_filtre, service_image, service_recherche};
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
            .wrap(Cors::permissive())
            // HTTP:GET TOUS LES STATIONNEMENTS
            // http://localhost:8080/stationnements
            .service(service_affichage::get_stationnements)
            // HTTP:GET UN STATIONNEMENT
            // http://localhost:8080/stationnements/{id}
            // Exemple: http://localhost:8080/stationnements/5881cb69-ad54-11ef-9b2b-6c02e03fe7b3
            .service(service_affichage::get_stationnement)
            // HTTP:GET TOUS LES STATIONNEMENTS ENTRE L'HEURE DÉTERMINÉE ET L'HEURE FINAL CALULÉE
            // http://localhost:8080/stationnements/{heuresDebut}/{heuresPrevus}
            // Exemple: http://localhost:8080/stationnements/08:00/01:00
            .service(service_filtre::get_stationnements_heure)
            // HTTP:GET TROUVER UN STATIONNEMENT AVEC L'ADRESSE DONNÉ
            // http://localhost:8080/stationnement/{numero_municipal}/{rue}/{code_postal}
            // Exemple: http://localhost:8080/stationnements/1001/ajhawd aeas/H4N 0G5
            .service(service_recherche::get_stationnements_avec_adresse)
            .service(service_image::get_image)
    })
    // Adresse réseau avec le port 8080
    .bind("localhost:8080")?
    .run()
    .await
}
