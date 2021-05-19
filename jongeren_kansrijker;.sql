CREATE DATABASE jongeren_kansrijker;

USE jongeren_kansrijker;

CREATE TABLE jongere(
    jongere_code VARCHAR(5) NOT NULL AUTO_INCREMENT,
    roepnaam VARCHAR(20) NOT NULL,
    tussenvoegsel VARCHAR(7) NOT NULL,
    achternaam VARCHAR(25) NOT NULL,
    inschrijfdatum DATE NOT NULL,
    PRIMARY KEY (jongerecode)
);

CREATE TABLE instituut(
    instituut_code VARCHAR(5) NOT NULL AUTO_INCREMENT,
    instituut VARCHAR(40) NOT NULL,
    instituut_telefoon VARCHAR(11) NOT NULL,
    PRIMARY KEY (instituut_code)
);

CREATE TABLE jongere_instituut(
    jongere_code VARCHAR(5) NOT NULL,
    instituut_code VARCHAR(5) NOT NULL,
    start_datum DATE NOT NULL,
    FOREIGN KEY (jongere_code) REFERENCES jongere(jongere_code),
    FOREIGN KEY (instituut_code) REFERENCES instituut(instituut_code)
);

CREATE TABLE activiteit(
    activiteits_code VARCHAR(3) NOT NULL AUTO_INCREMENT,
    activiteit VARCHAR(40) NOT NULL,
    PRIMARY KEY (activiteits_code)
);

CREATE TABLE jongere_activiteit(
    jongere_code VARCHAR(5) NOT NULL,
    activiteits_code VARCHAR(3) NOT NULL,
    start_datum DATE NOT NULL,
    afgerond TINYINT(1) NOT NULL,
    FOREIGN KEY (jongere_code) REFERENCES jongere(jongere_code),
    FOREIGN KEY (activiteits_code) REFERENCES activiteit(activiteits_code) 
);