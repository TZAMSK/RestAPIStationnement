use postgres::{Client, Error as PostgresError, NoTls};
use std::env;

pub const OK_REPONSE: &str = "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n";
pub const PAS_TROUVE: &str = "HTTP/1.1 404 PAS TROUVÉ\r\n\r\n";
pub const PROBLEME_SERVEUR_INTERNE: &str = "HTTP/1.1 500 PROBLÈME SERVEUR INTERNE\r\n\r\n";

pub fn get_base_de_données_url() -> String {
    env::var("DATABASE_URL")
        .unwrap_or_else(|_| panic!("DATABASE_URL introuvable dans l'environnement"))
}

pub fn définir_base_données() -> Result<(), PostgresError> {
    let bd_url = get_base_de_données_url();
    let mut client = Client::connect(&bd_url, NoTls)?;

    client.execute(
        "CREATE TABLE IF NOT EXISTS stationnements (
            id SEVERAL PRIMARY KEY,
            adresse TEXT NOT NULL,
            longitude INT NOT NULL,
            latitude INT NOT NULL,
            panneau TEXT NOT NULL,
            heuresDispoDébut TEXT NOT NULL,
            heuresDispoFin TEXT NOT NULL,
            dateDispo TEXT NOT NULL);",
        &[],
    )?;
    Ok(())
}
