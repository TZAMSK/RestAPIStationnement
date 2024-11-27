DROP DATABASE if EXISTS stationnementAPI;
CREATE DATABASE stationnementAPI;

use stationnementAPI;

CREATE TABLE IF NOT EXISTS stationnements (
    id SERIAL PRIMARY KEY,
    numero_municipal VARCHAR(255) NOT NULL,
	rue VARCHAR(255) NOT NULL,
	code_postal VARCHAR(255) NOT NULL,
    longitude INT NOT NULL,
    latitude INT NOT NULL,
    panneau TEXT NOT NULL,
    heuresDispoDébut TEXT NOT NULL,
    heuresDispoFin TEXT NOT NULL,
    dateDispo TEXT NOT NULL);
);
