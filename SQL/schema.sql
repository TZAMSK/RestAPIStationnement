DROP DATABASE if exists stationnementsdb;
CREATE DATABASE stationnementsdb;

use stationnementsdb;

CREATE TABLE stationnements (
    id CHAR(36) PRIMARY KEY,                          
    numero_municipal VARCHAR(50) NOT NULL,       
    rue VARCHAR(255) NOT NULL,                   
    code_postal VARCHAR(10) NOT NULL,            
    longitude DOUBLE PRECISION NOT NULL,         
    latitude DOUBLE PRECISION NOT NULL,          
    panneau TEXT NOT NULL,
    heures_debut TIME NOT NULL,
    heures_fin TIME NOT NULL,           
    date_dispo VARCHAR(50) NOT NULL              
);