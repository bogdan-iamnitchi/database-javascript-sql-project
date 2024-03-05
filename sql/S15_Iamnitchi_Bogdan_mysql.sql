DROP TABLE P_CUPOANE;
DROP TABLE P_ZBORURI;
DROP TABLE P_BILETE;
DROP TABLE P_CLIENTI;

/*DROP VIEW BileteVIP;*/

/*-------------------- a) -----------------------*/
CREATE TABLE P_CLIENTI(
    idclient INT NOT NULL,
    nume VARCHAR(25),
    statut VARCHAR(3),
    adresa VARCHAR(50),
    CHECK (statut='VIP' OR statut='C')
);

/*-------------------- b) -----------------------*/
CREATE TABLE P_BILETE(
    nrbilet INT NOT NULL,
    clasa VARCHAR(10),
    valoare DOUBLE,
    sursa VARCHAR(50),
    destinatie VARCHAR(50),
    idclient INT NOT NULL,
    CHECK (LOWER(clasa)='economic' OR LOWER(clasa)='business')
);

/*-------------------- c) -----------------------*/
CREATE TABLE P_ZBORURI(
    nrzbor VARCHAR(6) NOT NULL,
    plecare DATETIME NOT NULL,
    sosire DATETIME,
    de_la VARCHAR(50),
    la VARCHAR(50),
    aparat_zbor VARCHAR(30),
    nr_locuri INT
);

/*-------------------- d) -----------------------*/
CREATE TABLE P_CUPOANE(
    nrbilet INT NOT NULL,
    nrzbor VARCHAR(8) NOT NULL,
    plecare DATETIME NOT NULL,
    clasa_efectiva VARCHAR(10),
    loc INT
);

/*-------------------- e) -----------------------*/
ALTER TABLE P_CLIENTI 
ADD PRIMARY KEY (idclient);

ALTER TABLE P_BILETE
ADD PRIMARY KEY (nrbilet);

ALTER TABLE P_BILETE
ADD FOREIGN KEY (idclient) REFERENCES P_CLIENTI(idclient) ON DELETE CASCADE;

ALTER TABLE P_ZBORURI
ADD PRIMARY KEY (nrzbor, plecare);

ALTER TABLE P_CUPOANE
ADD PRIMARY KEY (nrbilet, nrzbor, plecare);

ALTER TABLE P_CUPOANE
ADD FOREIGN KEY (nrbilet) REFERENCES P_BILETE(nrbilet) ON DELETE CASCADE;

ALTER TABLE P_CUPOANE
ADD FOREIGN KEY (nrzbor, plecare) REFERENCES P_ZBORURI(nrzbor, plecare) ON DELETE CASCADE;

/*-------------------- f) -----------------------*/
ALTER TABLE P_CLIENTI
ADD telefon VARCHAR(13);


/*--------------------------------------------------|2|------------------------------------------------------------------*/
/*-------------------- a) -----------------------*/
ALTER TABLE P_ZBORURI
ADD CHECK (nr_locuri>=1 AND nr_locuri<=800);

/*-------------------- b) -----------------------*/
ALTER TABLE P_CUPOANE
ADD CHECK ((LOWER(clasa_efectiva)='business' AND (loc>=1 AND loc<=10)) OR (LOWER(clasa_efectiva)='economic' AND (loc>=10)));


/*-------------------- Insert-uri -----------------------*/
INSERT INTO P_CLIENTI VALUES (121, 'John Doe', 'C', '02 Moose Street', '(634) 2223715');
INSERT INTO P_CLIENTI VALUES (242, 'Waldo Doumer', 'VIP', '24 Shoshone Alley', '(236) 4213313');
INSERT INTO P_CLIENTI VALUES (343, 'Helena Hanigan', 'C', '7793 Garrison Street', '(755) 5373561');
INSERT INTO P_CLIENTI VALUES (314, 'Dorita Iamittii', 'C', '7905 Talisman Way', '(316) 5494675');
INSERT INTO P_CLIENTI VALUES (785, 'Cthrine Allsobrook', 'C', '2 Bartillon Road', '(701) 6632788');
INSERT INTO P_CLIENTI VALUES (546, 'Elayne Cockroft', 'C', '45827 Grim Junction', '(585) 7834730');
INSERT INTO P_CLIENTI VALUES (317, 'Madelene Deverose', 'C', '2039 Tennessee Lane', '(345) 3442032');
INSERT INTO P_CLIENTI VALUES (228, 'Reynold Oakinfold', 'VIP', '59 Cordelia Terrace', '(805) 1822446');
INSERT INTO P_CLIENTI VALUES (289, 'Ramsay Keer', 'C', '353 Arkansas Crossing', '(368) 6171406');
INSERT INTO P_CLIENTI VALUES (150, 'Myrlene Eastment', 'C', '6651 East Circle', '(761) 8974294');
INSERT INTO P_CLIENTI VALUES (120, 'Datha Judge', 'VIP', '9703 Charing Cross Court', '(468) 1085792');
INSERT INTO P_CLIENTI VALUES (199, 'Electra Swigg', 'VIP', '9198 Hanson Drive', '(175) 5940550');
INSERT INTO P_CLIENTI VALUES (425, 'Marlane Clewes', 'VIP', '5 Ruskin Road', '(571) 5370266');
INSERT INTO P_CLIENTI VALUES (204, 'Emmye Hexham', 'VIP', '742 Iowa Junction', '(734) 5962477');
INSERT INTO P_CLIENTI VALUES (100, 'Rutherford Glusby', 'C', '29 Victoria Court', '(906) 7951282');
INSERT INTO P_CLIENTI VALUES (362, 'Raven MacTavish', 'VIP', '70 Forest Run Way', '(801) 7856679');
INSERT INTO P_CLIENTI VALUES (171, 'Robyn Cud', 'C', '89449 Larry Parkway', '(267) 1784325');
INSERT INTO P_CLIENTI VALUES (189, 'Jana Smurthwaite', 'C', '70 South Parkway', '(915) 1663895');
INSERT INTO P_CLIENTI VALUES (191, 'Noak Hairesnape', 'VIP', '6 Vermont Drive', '(303) 3815947');
INSERT INTO P_CLIENTI VALUES (200, 'Woodie Seefeldt', 'C', '668 Anthes Circle', '(925) 8755726');
INSERT INTO P_CLIENTI VALUES (210, 'Antonietta Lowfill', 'C', '5 Hansons Court', '(901) 5139258');
INSERT INTO P_CLIENTI VALUES (322, 'Winonah Levinge', 'C', '67278 Ridgeview Trail', '(973) 8100511');
INSERT INTO P_CLIENTI VALUES (423, 'Cherlyn Jimmes', 'C', '711 Parkside Drive', '(941) 2330284');
INSERT INTO P_CLIENTI VALUES (524, 'Hedwig Sandell', 'VIP', '00 Sachs Terrace', '(646) 3687452');


INSERT INTO P_BILETE VALUES (101, 'Economic', 411.32, 'Frankfurt', 'New York', 242);
INSERT INTO P_BILETE VALUES (102, 'Business', 693.69, 'Cluj-Napoca', 'London', 343);
INSERT INTO P_BILETE VALUES (103, 'Economic', 449.49, 'Cluj-Napoca', 'Tokyo', 204);
INSERT INTO P_BILETE VALUES (104, 'Economic', 750.87, 'Cluj-Napoca', 'Tel Aviv', 785);
INSERT INTO P_BILETE VALUES (105, 'Business', 781.62, 'London', 'Keflavik', 317);
INSERT INTO P_BILETE VALUES (106, 'Economic', 166.66, 'Timisoara', 'Bucharest', 317);
INSERT INTO P_BILETE VALUES (107, 'Economic', 550.31, 'Timisoara', 'Rome', 228);
INSERT INTO P_BILETE VALUES (108, 'Business', 100.24, 'Cluj-Napoca', 'Bogota', 289);
INSERT INTO P_BILETE VALUES (109, 'Economic', 708.48, 'Frankfurt', 'Sydney', 524);
INSERT INTO P_BILETE VALUES (110, 'Economic', 127.68, 'London', 'Malta', 322);
INSERT INTO P_BILETE VALUES (111, 'Business', 578.65, 'Frankfurt', 'Keflavik', 121); 
INSERT INTO P_BILETE VALUES (112, 'Economic', 424.84, 'Tel Aviv', 'Tokyo', 200); 
INSERT INTO P_BILETE VALUES (113, 'Business', 700.08, 'Frankfurt', 'Tel Aviv', 204); 
INSERT INTO P_BILETE VALUES (114, 'Economic', 599.86, 'Buenos Aires', 'Lima', 199);
INSERT INTO P_BILETE VALUES (115, 'Business', 634.72, 'Cluj-Napoca', 'Malta', 121); 
INSERT INTO P_BILETE VALUES (116, 'Economic', 234.72, 'Frankfurt', 'Lima', 362);
INSERT INTO P_BILETE VALUES (117, 'Business', 234.72, 'Cluj-Napoca', 'Sydney', 343);
INSERT INTO P_BILETE VALUES (118, 'Economic', 411.32, 'Frankfurt', 'New York', 121);
INSERT INTO P_BILETE VALUES (119, 'Economic', 511.32, 'Frankfurt', 'London', 785);
INSERT INTO P_BILETE VALUES (123, 'Economic', 511.32, 'Frankfurt', 'Taipei Taoyuan', 200);


INSERT INTO P_ZBORURI VALUES ('LH400',  '2023-01-09 14:40', '2023-01-09 13:36', 'Frankfurt', 'New York', 'Boeing B744', 235);
INSERT INTO P_ZBORURI VALUES ('BA3385', '2022-08-03 08:45', '2022-08-03 09:46', 'Frankfurt', 'London', 'Airbus A300-600', 470);
INSERT INTO P_ZBORURI VALUES ('LH1474', '2022-12-15 14:38', '2022-12-15 17:13', 'Frankfurt', 'Cluj-Napoca', 'Embraer E190', 20);
INSERT INTO P_ZBORURI VALUES ('QR68',   '2023-06-08 15:02', '2023-06-08 23:34', 'Frankfurt', 'Doha Hamad', 'Boeing B789', 540);
INSERT INTO P_ZBORURI VALUES ('LH510',  '2023-11-16 22:25', '2023-11-17 08:28', 'Frankfurt', 'Buenos Aires', 'Boeing B748', 775);
INSERT INTO P_ZBORURI VALUES ('AIF213', '2023-10-11 10:50', '2023-10-12 06:53', 'Frankfurt', 'Taipei Taoyuan', 'Boeing B77W', 45);
INSERT INTO P_ZBORURI VALUES ('LH1473', '2022-09-13 10:18', '2022-09-13 11:40', 'Cluj-Napoca', 'Frankfurt', 'Embraer E190', 50);
INSERT INTO P_ZBORURI VALUES ('W63301', '2022-12-16 06:17', '2022-12-16 07:30', 'Cluj-Napoca', 'London', 'Airbus A320', 680);
INSERT INTO P_ZBORURI VALUES ('W63479', '2023-02-22 06:21', '2023-02-22 08:55', 'Cluj-Napoca', 'Tel Aviv', 'Airbus A321', 315);
INSERT INTO P_ZBORURI VALUES ('W63401', '2023-03-28 18:27', '2023-03-28 21:47', 'Cluj-Napoca', 'Madrid', 'Airbus A321', 315);
INSERT INTO P_ZBORURI VALUES ('U22295', '2022-08-03 10:40', '2022-08-03 14:07', 'London', 'Keflavik', 'Airbus A320', 485);
INSERT INTO P_ZBORURI VALUES ('FR3882', '2022-12-16 09:08', '2022-12-16 13:23', 'London', 'Malta', 'Boeing B738', 420);
INSERT INTO P_ZBORURI VALUES ('AV11',   '2022-04-14 14:44', '2022-04-14 19:57', 'Madrid', 'Bogota', 'Boeing B788', 505);
INSERT INTO P_ZBORURI VALUES ('PU901',  '2023-12-05 12:45', '2023-12-05 23:29', 'Madrid', 'Johannesburg', 'Airbus A346', 324);
INSERT INTO P_ZBORURI VALUES ('CX676',  '2023-12-24 14:27', '2023-12-24 06:17', 'Tel Aviv', 'Hong Kong', 'Airbus A35K', 90);
INSERT INTO P_ZBORURI VALUES ('LY81',   '2023-08-10 23:21', '2023-08-11 14:35', 'Tel Aviv', 'Bangkok', 'Boeing B772', 560);
INSERT INTO P_ZBORURI VALUES ('QR909',  '2023-12-07 21:27', '2022-12-08 04:51', 'Doha Hamad', 'Sydney', 'Airbus A388', 695);
INSERT INTO P_ZBORURI VALUES ('QF24',   '2023-12-19 18:57', '2023-12-19 07:34', 'Bangkok', 'Sydney', 'Airbus A333', 330);
INSERT INTO P_ZBORURI VALUES ('JL26',   '2023-10-28 15:46', '2022-10-28 20:17', 'Hong Kong', 'Tokyo', 'Boeing B788', 465);
INSERT INTO P_ZBORURI VALUES ('AIF213', '2023-08-15 10:45', '2023-08-16 13:05', 'Buenos Aires', 'Lima', 'Airbus A310-325', 92);
INSERT INTO P_ZBORURI VALUES ('RO608',  '2022-08-03 19:45', '2022-08-03 20:45', 'Timisoara', 'Bucharest', 'Boeing B738', 230);
INSERT INTO P_ZBORURI VALUES ('W63503', '2022-08-03 19:30', '2022-08-03 20:30', 'Timisoara', 'Frankfurt', 'Airbus A320', 365);
INSERT INTO P_ZBORURI VALUES ('W63547', '2022-08-03 10:45', '2022-08-03 11:45', 'Timisoara', 'Rome', 'Airbus A21N', 60);

INSERT INTO P_CUPOANE VALUES (101, 'LH400',  '2023-01-09 14:40', 'Economic', 26);
INSERT INTO P_CUPOANE VALUES (102, 'W63301', '2022-12-16 06:17', 'Business', 1);
INSERT INTO P_CUPOANE VALUES (103, 'W63479', '2023-02-22 06:21', 'Economic', 530);
INSERT INTO P_CUPOANE VALUES (103, 'CX676',  '2023-12-24 14:27', 'Economic', 588);
INSERT INTO P_CUPOANE VALUES (103, 'JL26',   '2023-10-28 15:46', 'Economic', 394);
INSERT INTO P_CUPOANE VALUES (104, 'W63479', '2023-02-22 06:21', 'Economic', 319);
INSERT INTO P_CUPOANE VALUES (105, 'U22295', '2022-08-03 10:40', 'Business', 5);
INSERT INTO P_CUPOANE VALUES (106, 'RO608',  '2022-08-03 19:45', 'Economic', 290);
INSERT INTO P_CUPOANE VALUES (107, 'W63547', '2022-08-03 10:45', 'Economic', 567);
INSERT INTO P_CUPOANE VALUES (108, 'W63401', '2023-03-28 18:27', 'Business', 7);
INSERT INTO P_CUPOANE VALUES (108, 'AV11',   '2022-04-14 14:44', 'Business', 9);
INSERT INTO P_CUPOANE VALUES (109, 'QR68',   '2023-06-08 15:02', 'Economic', 166);
INSERT INTO P_CUPOANE VALUES (109, 'QR909',  '2023-12-07 21:27', 'Economic', 216);
INSERT INTO P_CUPOANE VALUES (110, 'FR3882', '2022-12-16 09:08', 'Economic', 324);
INSERT INTO P_CUPOANE VALUES (111, 'W63503', '2022-08-03 19:30', 'Business', 6);
INSERT INTO P_CUPOANE VALUES (111, 'BA3385', '2022-08-03 08:45', 'Business', 7);
INSERT INTO P_CUPOANE VALUES (111, 'U22295', '2022-08-03 10:40', 'Business', 2);
INSERT INTO P_CUPOANE VALUES (112, 'CX676',  '2023-12-24 14:27', 'Economic', 304);
INSERT INTO P_CUPOANE VALUES (112, 'JL26',   '2023-10-28 15:46', 'Economic', 234);
INSERT INTO P_CUPOANE VALUES (113, 'LH1474', '2022-12-15 14:38', 'Business', 3);
INSERT INTO P_CUPOANE VALUES (113, 'W63479', '2023-02-22 06:21', 'Business', 10);
INSERT INTO P_CUPOANE VALUES (114, 'AIF213', '2023-08-15 10:45', 'Economic', 758);
INSERT INTO P_CUPOANE VALUES (115, 'W63301', '2022-12-16 06:17', 'Business', 1);
INSERT INTO P_CUPOANE VALUES (115, 'FR3882', '2022-12-16 09:08', 'Business', 2);
INSERT INTO P_CUPOANE VALUES (116, 'LH510',  '2023-11-16 22:25', 'Economic', 145);
INSERT INTO P_CUPOANE VALUES (116, 'AIF213', '2023-08-15 10:45', 'Economic', 276);
INSERT INTO P_CUPOANE VALUES (117, 'W63479', '2023-02-22 06:21', 'Economic', 421);
INSERT INTO P_CUPOANE VALUES (117, 'LY81',   '2023-08-10 23:21', 'Economic', 234);
INSERT INTO P_CUPOANE VALUES (117, 'QF24',   '2023-12-19 18:57', 'Economic', 500);
INSERT INTO P_CUPOANE VALUES (118, 'LH400',  '2023-01-09 14:40', 'Economic', 215);

/*------------------------------------------------------------|3|------------------------------------------------------------------*/
/*-------------------- a) -----------------------*/
DELIMITER //

CREATE PROCEDURE interogare3A(IN value1 int, IN value2 int)
BEGIN
    SELECT clasa, sursa, destinatie FROM P_BILETE
    WHERE idclient >= value1 AND idclient <= value2
    ORDER BY valoare DESC, sursa;
END 

// DELIMITER ;

/*-------------------- b) -----------------------*/
DELIMITER //

CREATE PROCEDURE interogare3B(IN value1 int)
BEGIN
    SELECT aparat_zbor, nr_locuri FROM P_ZBORURI
	WHERE nr_locuri <= value1
	ORDER BY nr_locuri DESC;
END 

// DELIMITER ;



/*------------------------------------------------------------|4|------------------------------------------------------------------*/
/*-------------------- a) -----------------------*/
DELIMITER //

CREATE PROCEDURE interogare4A(IN value1 varchar(50))
BEGIN
    SELECT P_CUPOANE.nrzbor, de_la, la, DATE_FORMAT(P_CUPOANE.plecare, '%d-%m-%Y %H:%i') AS Plecare FROM P_CLIENTI 
    INNER JOIN P_BILETE ON P_CLIENTI.idclient = P_BILETE.idclient
    INNER JOIN P_CUPOANE ON P_CUPOANE.nrbilet = P_BILETE.nrbilet
    INNER JOIN P_ZBORURI ON P_ZBORURI.nrzbor = P_CUPOANE.nrzbor
    WHERE nume = 'John Doe' AND ( la = value1 OR de_la = value1);
END 

// DELIMITER ;



/*-------------------- b) -----------------------*/
DELIMITER //

CREATE PROCEDURE interogare4B()
BEGIN
    SELECT c1.nrbilet, c1.nrzbor "Zbor1", DATE_FORMAT(c1.plecare, '%d-%m-%Y %H:%i') "Plecare1", c2.nrzbor "Zbor2", DATE_FORMAT(c2.plecare, '%d-%m-%Y %H:%i') "Plecare2" 
    FROM P_CUPOANE c1
    CROSS JOIN P_CUPOANE c2 
    WHERE c1.nrbilet = c2.nrbilet AND c1.nrzbor > c2.nrzbor;
END 

// DELIMITER ;



/*------------------------------------------------------------|5|------------------------------------------------------------------*/
/*-------------------- a) -----------------------*/
DELIMITER //

CREATE PROCEDURE interogare5A(IN value1 varchar(50))
BEGIN
    SELECT nume, a.idclient, b.valoare FROM P_BILETE b
INNER JOIN P_Clienti a ON a.idclient = b.idclient
WHERE NOT EXISTS
(
    SELECT c.valoare FROM P_BILETE c 
    WHERE b.valoare > c.valoare AND b.idclient=c.idclient
    AND c.clasa = value1
)
AND b.clasa = value1;
END 

// DELIMITER ;

/*-------------------- b) -----------------------*/
DELIMITER //

CREATE PROCEDURE interogare5B(IN value1 varchar(50), IN value2 varchar(50))
BEGIN
    SELECT nrbilet, clasa, valoare, sursa, destinatie FROM P_BILETE b
    WHERE b.idclient IN 
    (
        SELECT c1.idclient FROM P_CLIENTI c1 
        WHERE c1.statut = (SELECT c2.statut FROM P_CLIENTI c2 WHERE c2.nume = value1 AND c1.nume != value1)
    )
    AND b.destinatie = value2;
END 

// DELIMITER ;


/*------------------------------------------------------------|6|------------------------------------------------------------------*/
/*-------------------- a) -----------------------*/
DELIMITER //

CREATE PROCEDURE interogare6A(IN value1 int)
BEGIN
    SELECT z.nrzbor, COUNT(*) "Locuri_Ocupate" FROM P_ZBORURI z
    INNER JOIN P_CUPOANE c ON c.nrzbor = z.nrzbor
    WHERE EXTRACT(YEAR FROM z.plecare) = value1
    GROUP BY z.nrzbor;
END 

// DELIMITER ;



/*-------------------- b) -----------------------*/
DELIMITER //

CREATE PROCEDURE interogare6B()
BEGIN
    SELECT a.idclient, MIN(b.valoare) AS "Valoare_minima", ROUND(AVG(b.valoare),2) "Valoare_medie", MAX(b.valoare) "Valoare_maxima"
    FROM P_CLIENTI a INNER JOIN P_BILETE b ON a.idclient = b.idclient
    GROUP BY a.idclient;
END 

// DELIMITER ;

/*-------------------------IN PLUS-------------------------*/
DELIMITER //
CREATE PROCEDURE interogareClienti(IN value1 int)
BEGIN
    IF value1 = 'ALL' THEN
    	SELECT * FROM p_clienti;
    ELSE 
    	SELECT * FROM p_clienti
        WHERE nume = value1;
    END IF;
END 
// DELIMITER ;




DELIMITER //
CREATE PROCEDURE interogareZboruri(IN value1 varchar(50), IN value2 varchar(50))
BEGIN
    IF value1 = '' AND value2 = '' THEN
    	SELECT nrzbor, DATE_FORMAT(plecare, '%d-%m-%Y %H:%i') AS "plecare", DATE_FORMAT(sosire, '%d-%m-%Y %H:%i') AS "sosire", de_la, la, aparat_zbor, nr_locuri FROM p_zboruri;
    ELSEIF value1 != '' AND value2 = '' THEN
    	SELECT nrzbor, DATE_FORMAT(plecare, '%d-%m-%Y %H:%i') AS "plecare", DATE_FORMAT(sosire, '%d-%m-%Y %H:%i') AS "sosire", de_la, la, aparat_zbor, nr_locuri FROM p_zboruri
        WHERE nrzbor = value1;
    ELSEIF value1 = '' AND value2 != '' THEN
    	SELECT nrzbor, DATE_FORMAT(plecare, '%d-%m-%Y %H:%i') AS "plecare", DATE_FORMAT(sosire, '%d-%m-%Y %H:%i') AS "sosire", de_la, la, aparat_zbor, nr_locuri FROM p_zboruri
        WHERE DATE_FORMAT(plecare, '%d-%m-%Y') = value2;
    ELSEIF value1 != '' AND value2 != '' THEN
    	SELECT nrzbor, DATE_FORMAT(plecare, '%d-%m-%Y %H:%i') AS "plecare", DATE_FORMAT(sosire, '%d-%m-%Y %H:%i') AS "sosire", de_la, la, aparat_zbor, nr_locuri FROM p_zboruri
        WHERE nrzbor = value1 AND DATE_FORMAT(plecare, '%d-%m-%Y') = value2;
    END IF;
END 
// DELIMITER ;


DELIMITER //
CREATE PROCEDURE interogareBilete(IN value1 varchar(50), IN value2 varchar(50))
BEGIN
    IF value1 = '' AND value2 = '' THEN
    	SELECT nrbilet, clasa, valoare, sursa, destinatie, P_CLIENTI.nume AS "nume_client" FROM P_CLIENTI 
   		INNER JOIN P_BILETE ON P_CLIENTI.idclient = P_BILETE.idclient;
    ELSEIF value1 != '' AND value2 = '' THEN
    	SELECT nrbilet, clasa, valoare, sursa, destinatie, P_CLIENTI.nume AS "nume_client" FROM P_CLIENTI 
   		INNER JOIN P_BILETE ON P_CLIENTI.idclient = P_BILETE.idclient
    	WHERE nume = value1;
    ELSEIF value1 = '' AND value2 != '' THEN
    	SELECT nrbilet, clasa, valoare, sursa, destinatie, P_CLIENTI.nume AS "nume_client" FROM P_CLIENTI 
   		INNER JOIN P_BILETE ON P_CLIENTI.idclient = P_BILETE.idclient
    	WHERE nrbilet = value2;
    ELSEIF value1 != '' AND value2 != '' THEN
    	SELECT nrbilet, clasa, valoare, sursa, destinatie, P_CLIENTI.nume AS "nume_client" FROM P_CLIENTI 
   		INNER JOIN P_BILETE ON P_CLIENTI.idclient = P_BILETE.idclient
    	WHERE nume = value1 AND nrbilet = value2;
    END IF;
END 
// DELIMITER ;


DELIMITER //
CREATE PROCEDURE interogareCupoane(IN value1 varchar(50), IN value2 varchar(50), IN value3 varchar(50))
BEGIN
    IF value1 = '' AND value2 = ''  AND value3 = '' THEN
    	SELECT nrbilet, nrzbor, DATE_FORMAT(plecare, '%d-%m-%Y %H:%i') AS "plecare", clasa_efectiva, loc FROM p_cupoane;
    ELSEIF value1 != '' AND value2 = ''  AND value3 = '' THEN
    	SELECT nrbilet, nrzbor, DATE_FORMAT(plecare, '%d-%m-%Y %H:%i') AS "plecare", clasa_efectiva, loc FROM p_cupoane
        WHERE nrbilet = value1;
    ELSEIF value1 = '' AND value2 != ''  AND value3 = '' THEN
    	SELECT nrbilet, nrzbor, DATE_FORMAT(plecare, '%d-%m-%Y %H:%i') AS "plecare", clasa_efectiva, loc FROM p_cupoane
        WHERE nrzbor = value2;
    ELSEIF value1 = '' AND value2 = ''  AND value3 != '' THEN
    	SELECT nrbilet, nrzbor, DATE_FORMAT(plecare, '%d-%m-%Y %H:%i') AS "plecare", clasa_efectiva, loc FROM p_cupoane
        WHERE DATE_FORMAT(plecare, '%d-%m-%Y') = value3;
    ELSEIF value1 != '' AND value2 != ''  AND value3 = '' THEN
    	SELECT nrbilet, nrzbor, DATE_FORMAT(plecare, '%d-%m-%Y %H:%i') AS "plecare", clasa_efectiva, loc FROM p_cupoane
        WHERE nrbilet = value1 AND nrzbor = value2;
    ELSEIF value1 != '' AND value2 = ''  AND value3 != '' THEN
    	SELECT nrbilet, nrzbor, DATE_FORMAT(plecare, '%d-%m-%Y %H:%i') AS "plecare", clasa_efectiva, loc FROM p_cupoane
        WHERE nrbilet = value1 AND DATE_FORMAT(plecare, '%d-%m-%Y') = value3;
    ELSEIF value1 = '' AND value2 != ''  AND value3 != '' THEN
    	SELECT nrbilet, nrzbor, DATE_FORMAT(plecare, '%d-%m-%Y %H:%i') AS "plecare", clasa_efectiva, loc FROM p_cupoane
        WHERE nrzbor = value2 AND DATE_FORMAT(plecare, '%d-%m-%Y') = value3;
    ELSEIF value1 != '' AND value2 != ''  AND value3 != '' THEN
    	SELECT nrbilet, nrzbor, DATE_FORMAT(plecare, '%d-%m-%Y %H:%i') AS "plecare", clasa_efectiva, loc FROM p_cupoane
        WHERE nrbilet = value1 AND nrzbor = value2 AND DATE_FORMAT(plecare, '%d-%m-%Y') = value3;
    END IF;
END 
// DELIMITER ;





