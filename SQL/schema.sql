DROP DATABASE if exists stationnementsdb;
CREATE DATABASE stationnementsdb;

use stationnementsdb;

CREATE TABLE stationnements (
    id CHAR(36) PRIMARY KEY,                          -- Unique identifier for each stationnement
    numero_municipal VARCHAR(50) NOT NULL,       -- Street number
    rue VARCHAR(255) NOT NULL,                   -- Street name
    code_postal VARCHAR(10) NOT NULL,            -- Postal code
    longitude DOUBLE PRECISION NOT NULL,         -- Longitude coordinate
    latitude DOUBLE PRECISION NOT NULL,          -- Latitude coordinate
    panneau TEXT NOT NULL,                       -- Reference to the panneau (image or description)
    heures_dispo VARCHAR(50) NOT NULL,           -- Hours available
    date_dispo VARCHAR(50) NOT NULL              -- Date available
);