use postgres::{Client, Error as PostgresError, NoTls};
use std::env;
use std::fs;

pub const OK_REPONSE: &str = "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n";
pub const PAS_TROUVE: &str = "HTTP/1.1 404 PAS TROUVÉ\r\n\r\n";
pub const PROBLEME_SERVEUR_INTERNE: &str = "HTTP/1.1 500 PROBLÈME SERVEUR INTERNE\r\n\r\n";

use lazy_static::lazy_static;

lazy_static! {
    pub static ref DATABASE_URL: String =
        env::var("DATABASE_URL").expect("DATABASE_URL must be set");
}

pub fn définir_base_données() -> Result<(), PostgresError> {
    let mut client = Client::connect(&DATABASE_URL, NoTls)?;
    let shema_sql = fs::read_to_string("../SQL/shema.sql").expect("Schéma introuvable");

    client.batch_execute(&shema_sql)?;

    Ok(())
}
