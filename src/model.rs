use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize)]
pub struct Stationnement {
    pub id: String,
    pub adresse: Adresse,
    pub coordonnee: Coordonnee,
    pub panneau: String,
    pub heures_dispo: String,
    pub date_dispo: String,
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
