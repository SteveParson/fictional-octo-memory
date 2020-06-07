DROP DATABASE IF EXISTS salesData;
CREATE DATABASE salesData;

USE salesData;

CREATE TABLE Assessment (
    pan VARCHAR(255) NOT NULL,
    year VARCHAR(255) NOT NULL,
    assessed_value VARCHAR(255) NOT NULL,
    tax_levy VARCHAR(255) NOT NULL,
    id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id)
);

CREATE TABLE PIDPAN (
    pid VARCHAR(255) NOT NULL,
    pan VARCHAR(255) NOT NULL,
    id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id)
);

CREATE TABLE Sales (
    pan VARCHAR(255) NOT NULL,
    date VARCHAR(255) NOT NULL,
    price VARCHAR(255) NOT NULL,
    id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id)
);

CREATE TABLE TA (
    tacd VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id)
);

CREATE TABLE Tombstone (
    pan VARCHAR(255) NOT NULL,
    loc VARCHAR(255) NOT NULL,
    tacd VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    assessment_year VARCHAR(255) NOT NULL,
    assessed_value VARCHAR(255) NOT NULL,
    tax_levy VARCHAR(255) NOT NULL,
    id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id)
);
