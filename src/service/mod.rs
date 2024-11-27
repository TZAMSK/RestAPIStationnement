use postgres::{Client, NoTls};

use crate::base_de_données;
use crate::modèle::{Adresse, Coordonnee, Stationnement};

fn obtenir_id_stationnement(requête: &str) -> &str {
    requête
        .split("/")
        .nth(2)
        .unwrap_or_default()
        .split_whitespace()
        .next()
        .unwrap_or_default()
}

pub fn gérer_get_stationnement(requête: &str) -> (String, String) {
    match (
        obtenir_id_stationnement(requête).parse::<i32>(),
        Client::connect(&base_de_données::DATABASE_URL, NoTls),
    ) {
        (Ok(id), Ok(mut client)) => {
            match client.query_one("SELECT * FROM stationnements WHERE id = $1", &[&id]) {
                Ok(row) => {
                    let stationnement = Stationnement {
                        id: row.get(0),
                        adresse: Adresse {
                            numero_municipal: row.get(1),
                            rue: row.get(2),
                            code_postal: row.get(3),
                        },
                        coordonnee: Coordonnee {
                            longitude: row.get(4),
                            latitude: row.get(5),
                        },
                        panneau: row.get(6),
                        heures_dispo: format!(
                            "{} - {}",
                            row.get::<usize, String>(7),
                            row.get::<usize, String>(8)
                        ),
                        date_dispo: row.get(9),
                    };
                    (
                        base_de_données::OK_REPONSE.to_string(),
                        serde_json::to_string(&stationnement).unwrap(),
                    )
                }
                _ => (
                    base_de_données::PAS_TROUVE.to_string(),
                    "Stationnement introuvable".to_string(),
                ),
            }
        }

        _ => (
            base_de_données::PROBLEME_SERVEUR_INTERNE.to_string(),
            "Erreur".to_string(),
        ),
    }
}

pub fn gérer_get_tous_stationnements() -> (String, String) {
    match Client::connect(&base_de_données::DATABASE_URL, NoTls) {
        Ok(mut client) => {
            let mut liste_stationnements = Vec::new();

            for row in client.query("SELECT * FROM stationnements", &[]).unwrap() {
                liste_stationnements.push(Stationnement {
                    id: row.get(0),
                    adresse: Adresse {
                        numero_municipal: row.get(1),
                        rue: row.get(2),
                        code_postal: row.get(3),
                    },
                    coordonnee: Coordonnee {
                        longitude: row.get(4),
                        latitude: row.get(5),
                    },
                    panneau: row.get(6),
                    heures_dispo: format!(
                        "{} - {}",
                        row.get::<usize, String>(7),
                        row.get::<usize, String>(8)
                    ),
                    date_dispo: row.get(9),
                });
            }

            (
                base_de_données::OK_REPONSE.to_string(),
                serde_json::to_string(&liste_stationnements).unwrap(),
            )
        }
        _ => (
            base_de_données::PROBLEME_SERVEUR_INTERNE.to_string(),
            "Erreur".to_string(),
        ),
    }
}
