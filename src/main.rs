use std::net::TcpListener;

// Faut spécifier le chemin parce que le nom utilise des caractères spéciaux
#[path = "base_de_données/mod.rs"]
mod base_de_données;

#[path = "modèle/mod.rs"]
mod modèle;

#[path = "contrôleur/mod.rs"]
mod contrôleur;

mod service;

#[macro_use]
extern crate serde_derive;

fn main() {
    // Appeler la base de donnée
    if let Err(e) = base_de_données::définir_base_données() {
        println!("Error {}", e);
        return;
    }

    let listener = TcpListener::bind(format!("0.0.0.0:8080")).unwrap();
    println!("Serveur initialisé au port 8080");

    for stream in listener.incoming() {
        match stream {
            Ok(stream) => {
                contrôleur::gérer_client(stream);
            }
            Err(e) => {
                println!("Erreur: {}", e);
            }
        }
    }
}
