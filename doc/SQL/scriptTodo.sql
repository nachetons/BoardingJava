-- DROP DATABASE instrumentos;
CREATE DATABASE instrumentos;
use instrumentos;

CREATE TABLE `ACTIVOS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(30) NOT NULL,
  `MERCADO` varchar(30) NOT NULL,
  `DESCRIPCCION` varchar(30),
  `TICKERBLOOMBERG` varchar(50) NOT NULL UNIQUE,
  `ACTIVO` Boolean NOT NULL DEFAULT 1,
  `LASTUPDATE`DATE,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `PRECIOS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRECIO` int(30) NOT NULL,
  `ACTIVO_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`ACTIVO_ID`) REFERENCES `ACTIVOS`(`ID`)
);

CREATE TABLE `USUARIOS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(30) NOT NULL UNIQUE,
  `APELLIDOS` varchar(10) NOT NULL,
  `ROL` varchar(15) NOT NULL UNIQUE,
  PRIMARY KEY (`ID`)
);

INSERT INTO ACTIVOS (NOMBRE, MERCADO, DESCRIPCCION, TICKERBLOOMBERG, ACTIVO, LASTUPDATE) VALUES ('Apple', 'NASDAQ', 'Empresa de tecnologia', 'AAPL US Equity', 1, '2023-05-18');
INSERT INTO ACTIVOS (NOMBRE, MERCADO, DESCRIPCCION, TICKERBLOOMBERG, ACTIVO, LASTUPDATE) VALUES ('Microsoft', 'NASDAQ', 'Empresa de tecnologia', 'MSFT US Equity', 1, '2023-05-18');
INSERT INTO ACTIVOS (NOMBRE, MERCADO, DESCRIPCCION, TICKERBLOOMBERG, ACTIVO, LASTUPDATE) VALUES ('Amazon', 'NASDAQ', 'Empresa de tecnologia', 'AMZN US Equity', 1, '2023-05-18');

INSERT INTO PRECIOS (PRECIO, ACTIVO_ID) VALUES (100, 1);
INSERT INTO PRECIOS (PRECIO, ACTIVO_ID) VALUES (200, 2);
INSERT INTO PRECIOS (PRECIO, ACTIVO_ID) VALUES (300, 3);

INSERT INTO USUARIOS (NOMBRE, APELLIDOS, ROL) VALUES ('admin', 'admin', 'admin');
INSERT INTO USUARIOS (NOMBRE, APELLIDOS, ROL) VALUES ('user', 'user', 'user');
