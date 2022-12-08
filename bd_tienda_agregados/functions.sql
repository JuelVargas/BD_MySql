USE AGREGADOS;

-- EJERCICIO 1

DELIMITER $$

CREATE FUNCTION EJERCICIO1(VALOR INT) RETURNS FLOAT
BEGIN
    DECLARE PMA FLOAT;

    SELECT MAX(M.PRECIO) INTO PMA
    FROM MATERIAL M
    INNER JOIN DEPOSITO D ON D.CODIGO = M.CODIGO
    WHERE D.CSALDO > VALOR;

    RETURN PMA;
END $$

DELIMITER ;

SELECT EJERCICIO1(10) AS 'PRECIO MAS ALTO BS.';

-- EJERCICIO 4

DELIMITER $$

CREATE FUNCTION EJERCICIO4(DESCRIPCION VARCHAR(255)) RETURNS FLOAT
BEGIN
    DECLARE SALDO FLOAT;

    SELECT D.CSALDO INTO SALDO
    FROM MATERIAL M
    INNER JOIN DEPOSITO D ON D.CODIGO = M.CODIGO
    WHERE M.DESCRIPCION = DESCRIPCION;

    RETURN SALDO;
END $$

DELIMITER ;

SELECT EJERCICIO4('ARENA');

-- EJERCICIO 11
DELIMITER $$

CREATE FUNCTION EJER11(CANTIDAD INT) RETURNS FLOAT
BEGIN
    DECLARE PMB FLOAT;

    SELECT MIN(M.PRECIO) INTO PMB
    FROM MATERIAL M
    INNER JOIN DEPOSITO D ON D.CODIGO = M.CODIGO
    WHERE D.CSALDO = CANTIDAD;

    RETURN PMB;
END $$

DELIMITER ;

SELECT EJER11(80) as 'precio mas bajo';

--  EJERICIO 12

DELIMITER $$

CREATE FUNCTION EJER12(ANIO INT) RETURNS INT
BEGIN
    DECLARE ULTIMA INT;
    DECLARE PRIMERA INT;
    DECLARE DIFERENCIA INT;

    SELECT MAX(S.NS) INTO ULTIMA
    FROM SOLICITUD S
    WHERE YEAR(S.FECHA) = ANIO;

    SELECT MIN(S.NS) INTO PRIMERA
    FROM SOLICITUD S
    WHERE YEAR(S.FECHA) = ANIO;

    SET DIFERENCIA = ULTIMA - PRIMERA;
    RETURN DIFERENCIA;
END $$

DELIMITER ;

SELECT EJER12('2022') AS 'DIFERENCIA';


-- EJERCICIO 13

DELIMITER $$

CREATE FUNCTION EJER13(ANIO INT, MES INT) RETURNS INT
BEGIN
    DECLARE NUMERO INT;

    SELECT COUNT(S.NS) INTO NUMERO
    FROM SOLICITUD S
    WHERE YEAR(S.FECHA) = ANIO AND MONTH(S.FECHA) = MES;

    RETURN NUMERO;
END $$

DELIMITER ;

SELECT EJER13('2022', '12') AS 'N SOLICITUDES';

-- EJERCICIO 14

DELIMITER $$

CREATE FUNCTION EJER14(LETRA1 CHAR, LETRA2 CHAR) RETURNS INT
BEGIN
    DECLARE MAXIMA INT;

    SELECT MAX(S.CANTIDAD) INTO MAXIMA
    FROM SOLICITUD S
    INNER JOIN MATERIAL M ON M.CODIGO = S.CODIGO
    WHERE M.DESCRIPCION LIKE CONCAT(LETRA1, '%')
    OR M.DESCRIPCION LIKE CONCAT(LETRA2, '%');

    RETURN MAXIMA;
END $$

DELIMITER ;

SELECT EJER14('Y', 'Z') AS 'CANTIDAD MAXIMA';