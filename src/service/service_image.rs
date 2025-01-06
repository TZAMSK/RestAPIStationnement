use actix_files::NamedFile;
use actix_web::{get, web, HttpRequest, HttpResponse, Responder};
use serde_json::json;
use std::path::PathBuf;

#[get("/panneaux_images/{image}")]
pub async fn get_image(path: web::Path<String>, req: HttpRequest) -> impl Responder {
    // Prendre en paramètre ce qui a été donné en paramètre
    let image = path.into_inner();

    // Le répértoire de l'image avec la variable image
    let image_path = PathBuf::from("./src/panneaux_images").join(image);

    if image_path.exists() {
        // Si le répértoire existe belle et bien
        // Ouvre l'image et prend en objet NamedFile
        // Transforme en une requête HTTP
        NamedFile::open(image_path)
            .map(|file| file.into_response(&req))
            // Une méthode qui retoure Result ou Option
            .unwrap_or_else(|_| {
                // Si pas ouvrable, erreur:
                HttpResponse::InternalServerError().json(json! ({
                        "Erreur": "Pas possible d'ouvrir l'image"
                }))
            })
    } else {
        // Si répértoire introuvable
        HttpResponse::NotFound().json(json! ({
                "Erreur": "Image introuvable..."
        }))
    }
}
