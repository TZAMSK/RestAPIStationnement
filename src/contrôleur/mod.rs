use std::io::{Read, Write};
use std::net::TcpStream;

use crate::base_de_données;

use crate::service;

pub fn gérer_client(mut stream: TcpStream) {
    let mut buffer = [0; 1024];
    let mut requête = String::new();

    match stream.read(&mut buffer) {
        Ok(size) => {
            requête.push_str(String::from_utf8_lossy(&buffer[..size]).as_ref());

            let (ligne_état, contenue) = match &*requête {
                r if r.starts_with("GET /stationnements/") => service::gérer_get_stationnement(r),
                r if r.starts_with("GET /stationnements") => {
                    service::gérer_get_tous_stationnements()
                }
                _ => (
                    base_de_données::PAS_TROUVE.to_string(),
                    "404 PAS TROUVÉ".to_string(),
                ),
            };

            stream
                .write_all(format!("{}{}", ligne_état, contenue).as_bytes())
                .unwrap();
        }
        Err(e) => {
            println!("Erreur {}", e);
        }
    }
}
