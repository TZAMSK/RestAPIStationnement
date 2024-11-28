use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize)]
pub struct Stationnement {
    pub id: String,
    pub adresse: Adresse,
    pub coordonnee: Coordonnee,
    pub panneau: Vec<u8>,
    pub heures_debut: String,
    pub heures_fin: String,
}

#[derive(Serialize, Deserialize)]
pub struct Coordonnee {
    pub longitude: f64,
    pub latitude: f64,
}

#[derive(Serialize, Deserialize)]
pub struct Adresse {
    pub numero_municipal: String,
    pub rue: String,
    pub code_postal: String,
}
