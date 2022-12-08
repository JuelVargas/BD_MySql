
CREATE DATABASE AGREGADOS
CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE AGREGADOS;

CREATE TABLE MATERIAL(
CODIGO INT auto_increment PRIMARY KEY,
DESCRIPCION VARCHAR(100) NOT NULL DEFAULT '',
PRECIO FLOAT DEFAULT '0.0'
)ENGINE = INNODB AUTO_INCREMENT = 1;

CREATE TABLE DEPOSITO(
CODIGO INT NOT NULL,
CENTRADA INT NOT NULL,
CSALIDA INT NOT NULL,
CSALDO INT NOT NULL,
FOREIGN KEY (CODIGO) references MATERIAL(CODIGO)
)ENGINE = INNODB;

CREATE TABLE SOLICITUD(
NS INT AUTO_INCREMENT PRIMARY KEY,
FECHA DATETIME NULL DEFAULT NOW(),
CANTIDAD INT NOT NULL,
CODIGO INT NOT NULL,
FOREIGN KEY (CODIGO) REFERENCES MATERIAL(CODIGO)
)ENGINE = INNODB;




















