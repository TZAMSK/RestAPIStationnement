DROP DATABASE if exists stationnementsdb;
CREATE DATABASE stationnementsdb;

use stationnementsdb;

CREATE TABLE stationnements (
    id INT AUTO_INCREMENT PRIMARY KEY,                          
    numero_municipal VARCHAR(50) NOT NULL,       
    rue VARCHAR(255) NOT NULL,                   
    code_postal VARCHAR(10) NOT NULL,            
    longitude DOUBLE PRECISION NOT NULL,         
    latitude DOUBLE PRECISION NOT NULL,          
    panneau VARCHAR(255) NOT NULL,
    heures_debut TIME NOT NULL,
    heures_fin TIME NOT NULL             
);
