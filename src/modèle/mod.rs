#[derive(Serialize, Deserialize)]
pub struct Stationnement {
    pub id: Option<i32>,
    pub adresse: String,
    pub coordonnee: Coordonnee,
    pub panneau: String,
    pub heures_dispo: String,
    pub date_dispo: String,
}

#[derive(Serialize, Deserialize)]
pub struct Coordonnee {
    pub longitude: i32,
    pub latitude: i32,
}
