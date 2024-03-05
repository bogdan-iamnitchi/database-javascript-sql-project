DROP TABLE P_CUPOANE;
DROP TABLE P_ZBORURI;
DROP TABLE P_BILETE;
DROP TABLE P_CLIENTI;

DROP VIEW BileteVIP;

ALTER SESSION SET nls_date_format='DD-MM-YYYY HH24:MI';

------------------------------------------------------------|1|------------------------------------------------------------------

--------- a) -----------
CREATE TABLE P_CLIENTI(
    idclient NUMBER NOT NULL,
    nume VARCHAR2(25),
    statut VARCHAR2(3),
    adresa VARCHAR2(50),
    CONSTRAINT CHK_TIP_PERSOANA CHECK (statut='VIP' OR statut='C')
);

--------- b) -----------
CREATE TABLE P_BILETE(
    nrbilet NUMBER NOT NULL,
    clasa VARCHAR2(10),
    valoare NUMBER,
    sursa VARCHAR2(50),
    destinatie VARCHAR2(50),
    idclient NUMBER NOT NULL,
    CONSTRAINT CHK_TIP_CLASA CHECK (LOWER(clasa)='economic' OR LOWER(clasa)='business')
);

--------- c) -----------
CREATE TABLE P_ZBORURI(
    nrzbor VARCHAR2(6) NOT NULL,
    plecare DATE NOT NULL,
    sosire DATE,
    de_la VARCHAR2(50),
    la VARCHAR2(50),
    aparat_zbor VARCHAR2(30),
    nr_locuri NUMBER
);

--------- d) -----------
CREATE TABLE P_CUPOANE(
    nrbilet NUMBER NOT NULL,
    nrzbor VARCHAR2(8) NOT NULL,
    plecare DATE NOT NULL,
    clasa_efectiva VARCHAR2(10),
    loc NUMBER
);

--------------------------------- e) --------------------------------------------------
--Clienti
ALTER TABLE P_CLIENTI 
ADD CONSTRAINT CLIENTI_idclient_PK PRIMARY KEY (idclient);

--Bilete
ALTER TABLE P_BILETE
ADD CONSTRAINT BILETE_nrbilet_PK PRIMARY KEY (nrbilet);

ALTER TABLE P_BILETE
ADD CONSTRAINT BILETE_idclient_FK FOREIGN KEY (idclient) REFERENCES P_CLIENTI(idclient) ON DELETE CASCADE;

--Zboruri
ALTER TABLE P_ZBORURI
ADD CONSTRAINT ZBORURI_nrzbor_plecare_PK PRIMARY KEY (nrzbor, plecare);

--Cupoane
ALTER TABLE P_CUPOANE
ADD CONSTRAINT CUPOANE_nrb_nrz_p_PK PRIMARY KEY (nrbilet, nrzbor, plecare);

ALTER TABLE P_CUPOANE
ADD CONSTRAINT CUPOANE_nrbilet_FK FOREIGN KEY (nrbilet) REFERENCES P_BILETE(nrbilet) ON DELETE CASCADE;

ALTER TABLE P_CUPOANE
ADD CONSTRAINT CUPOANE_nrz_p_FK FOREIGN KEY (nrzbor, plecare) REFERENCES P_ZBORURI(nrzbor, plecare) ON DELETE CASCADE;

--------------------------------- f) --------------------------------------------------
ALTER TABLE P_CLIENTI
ADD telefon VARCHAR2(13);


------------------------------------------------------------|2|------------------------------------------------------------------
--- a) ---
ALTER TABLE P_ZBORURI
ADD CONSTRAINT ZBORURI_nr_locuri_CHK CHECK (nr_locuri>=1 AND nr_locuri<=800);

--INSERT INTO P_ZBORURI VALUES ('LH401', '09-01-2023 14:40', '09-01-2023 13:36', 'Frankfurt', 'New York', 'Boeing B744', 950);

--- b) ---
ALTER TABLE P_CUPOANE
ADD CONSTRAINT CUPOANE_clasa_efectiva_CHK CHECK ((LOWER(clasa_efectiva)='business' AND (loc>=1 AND loc<=10)) OR (LOWER(clasa_efectiva)='economic' AND (loc>=10)));

--INSERT INTO P_CUPOANE VALUES (102, 'W63301', '16-12-2022 06:17', 'Business', 20);

---------------------------------------------------------INSERT--------------------------------------------------------------------
INSERT INTO P_CLIENTI VALUES (121, 'John Doe', 'C', '02 Moose Street', '(634) 2223715');
INSERT INTO P_CLIENTI VALUES (242, 'Waldo Doumer', 'VIP', '24 Shoshone Alley', '(236) 4213313');
INSERT INTO P_CLIENTI VALUES (143, 'Helena Hanigan', 'C', '7793 Garrison Street', '(755) 5373561');
INSERT INTO P_CLIENTI VALUES (314, 'Dorita Iamittii', 'C', '7905 Talisman Way', '(316) 5494675');
INSERT INTO P_CLIENTI VALUES (785, 'Cthrine Allsobrook', 'C', '2 Bartillon Road', '(701) 6632788');
INSERT INTO P_CLIENTI VALUES (546, 'Elayne Cockroft', 'C', '45827 Grim Junction', '(585) 7834730');
INSERT INTO P_CLIENTI VALUES (117, 'Madelene Deverose', 'C', '2039 Tennessee Lane', '(345) 3442032');
INSERT INTO P_CLIENTI VALUES (228, 'Reynold Oakinfold', 'VIP', '59 Cordelia Terrace', '(805) 1822446');
INSERT INTO P_CLIENTI VALUES (289, 'Ramsay Keer', 'C', '353 Arkansas Crossing', '(368) 6171406');
INSERT INTO P_CLIENTI VALUES (150, 'Myrlene Eastment', 'C', '6651 East Circle', '(761) 8974294');
INSERT INTO P_CLIENTI VALUES (120, 'Datha Judge', 'VIP', '9703 Charing Cross Court', '(468) 1085792');
INSERT INTO P_CLIENTI VALUES (199, 'Electra Swigg', 'VIP', '9198 Hanson Drive', '(175) 5940550');
INSERT INTO P_CLIENTI VALUES (425, 'Marlane Clewes', 'VIP', '5 Ruskin Road', '(571) 5370266');
INSERT INTO P_CLIENTI VALUES (204, 'Emmye Hexham', 'VIP', '742 Iowa Junction', '(734) 5962477');
INSERT INTO P_CLIENTI VALUES (100, 'Rutherford Glusby', 'C', '29 Victoria Court', '(906) 7951282');
INSERT INTO P_CLIENTI VALUES (162, 'Raven MacTavish', 'VIP', '70 Forest Run Way', '(801) 7856679');
INSERT INTO P_CLIENTI VALUES (171, 'Robyn Cud', 'C', '89449 Larry Parkway', '(267) 1784325');
INSERT INTO P_CLIENTI VALUES (189, 'Jana Smurthwaite', 'C', '70 South Parkway', '(915) 1663895');
INSERT INTO P_CLIENTI VALUES (191, 'Noak Hairesnape', 'VIP', '6 Vermont Drive', '(303) 3815947');
INSERT INTO P_CLIENTI VALUES (200, 'Woodie Seefeldt', 'C', '668 Anthes Circle', '(925) 8755726');
INSERT INTO P_CLIENTI VALUES (210, 'Antonietta Lowfill', 'C', '5 Hansons Court', '(901) 5139258');
INSERT INTO P_CLIENTI VALUES (322, 'Winonah Levinge', 'C', '67278 Ridgeview Trail', '(973) 8100511');
INSERT INTO P_CLIENTI VALUES (423, 'Cherlyn Jimmes', 'C', '711 Parkside Drive', '(941) 2330284');
INSERT INTO P_CLIENTI VALUES (524, 'Hedwig Sandell', 'VIP', '00 Sachs Terrace', '(646) 3687452');

---direct----
INSERT INTO P_BILETE VALUES (101, 'Economic', 411.32, 'Frankfurt', 'New York', 242);
---direct----
INSERT INTO P_BILETE VALUES (102, 'Business', 693.69, 'Cluj-Napoca', 'London', 143);
--Cluj-Tel Aviv-Hong Kong-Tokyo--
INSERT INTO P_BILETE VALUES (103, 'Economic', 449.49, 'Cluj-Napoca', 'Tokyo', 204);
---direct----
INSERT INTO P_BILETE VALUES (104, 'Economic', 750.87, 'Cluj-Napoca', 'Tel Aviv', 785);
---direct----
INSERT INTO P_BILETE VALUES (105, 'Business', 781.62, 'London', 'Keflavik', 117);
---direct----
INSERT INTO P_BILETE VALUES (106, 'Economic', 166.66, 'Timisoara', 'Bucharest', 117);
---direct----
INSERT INTO P_BILETE VALUES (107, 'Economic', 550.31, 'Timisoara', 'Rome', 228);
--Cluj-Madrid-Bogota--
INSERT INTO P_BILETE VALUES (108, 'Business', 100.24, 'Cluj-Napoca', 'Bogota', 289);
--Frankfurt-Doha-Sydney--
INSERT INTO P_BILETE VALUES (109, 'Economic', 708.48, 'Frankfurt', 'Sydney', 524);
---direct----
INSERT INTO P_BILETE VALUES (110, 'Economic', 127.68, 'London', 'Malta', 322);
--Frankfurt-London-Keflavik--
INSERT INTO P_BILETE VALUES (111, 'Business', 578.65, 'Frankfurt', 'Keflavik', 121); 
--Tel Aviv-Hong Kong-Tokyo--
INSERT INTO P_BILETE VALUES (112, 'Economic', 424.84, 'Tel Aviv', 'Tokyo', 200); 
--Frankfurt-Cluj-Tel Aviv--
INSERT INTO P_BILETE VALUES (113, 'Business', 700.08, 'Frankfurt', 'Tel Aviv', 204); 
---direct----
INSERT INTO P_BILETE VALUES (114, 'Economic', 599.86, 'Buenos Aires', 'Lima', 199);
--Cluj-London-Malta--
INSERT INTO P_BILETE VALUES (115, 'Business', 634.72, 'Cluj-Napoca', 'Malta', 121); 
--Frankfurt-buenos Aires-Lima--
INSERT INTO P_BILETE VALUES (116, 'Economic', 234.72, 'Frankfurt', 'Lima', 162);
--Cluj-Tel Aviv-Bangkok-Sydney--
INSERT INTO P_BILETE VALUES (117, 'Business', 234.72, 'Cluj-Napoca', 'Sydney', 143);
---direct----
INSERT INTO P_BILETE VALUES (118, 'Economic', 411.32, 'Frankfurt', 'New York', 121);
---direct----
INSERT INTO P_BILETE VALUES (119, 'Economic', 511.32, 'Frankfurt', 'London', 785);
---direct----
INSERT INTO P_BILETE VALUES (123, 'Economic', 511.32, 'Frankfurt', 'Taipei Taoyuan', 200);
--SELECT * FROM P_BILETE--

INSERT INTO P_ZBORURI VALUES ('LH400', '09-01-2023 14:40', '09-01-2023 13:36', 'Frankfurt', 'New York', 'Boeing B744', 235);
INSERT INTO P_ZBORURI VALUES ('BA3385', '03-08-2022 08:45', '03-08-2022 09:46', 'Frankfurt', 'London', 'Airbus A300-600', 470);
INSERT INTO P_ZBORURI VALUES ('LH1474', '15-12-2022 14:38', '15-12-2022 17:13', 'Frankfurt', 'Cluj-Napoca', 'Embraer E190', 20);
INSERT INTO P_ZBORURI VALUES ('QR68', '08-06-2023 15:02', '08-06-2023 23:34', 'Frankfurt', 'Doha Hamad', 'Boeing B789', 540);
INSERT INTO P_ZBORURI VALUES ('LH510', '16-11-2023 22:25', '17-11-2023 08:28', 'Frankfurt', 'Buenos Aires', 'Boeing B748', 775);
INSERT INTO P_ZBORURI VALUES ('AIF213', '11-10-2023 10:50', '12-10-2023 06:53', 'Frankfurt', 'Taipei Taoyuan', 'Boeing B77W', 45);
INSERT INTO P_ZBORURI VALUES ('LH1473', '13-09-2022 10:18', '13-09-2022 11:40', 'Cluj-Napoca', 'Frankfurt', 'Embraer E190', 50);
INSERT INTO P_ZBORURI VALUES ('W63301', '16-12-2022 06:17', '16-12-2022 07:30', 'Cluj-Napoca', 'London', 'Airbus A320', 680);
INSERT INTO P_ZBORURI VALUES ('W63479', '22-02-2023 06:21', '22-02-2023 08:55', 'Cluj-Napoca', 'Tel Aviv', 'Airbus A321', 315);
INSERT INTO P_ZBORURI VALUES ('W63401', '28-03-2023 18:27', '28-03-2023 21:47', 'Cluj-Napoca', 'Madrid', 'Airbus A321', 315);
INSERT INTO P_ZBORURI VALUES ('U22295', '03-08-2022 10:40', '03-08-2022 14:07', 'London', 'Keflavik', 'Airbus A320', 485);
INSERT INTO P_ZBORURI VALUES ('FR3882', '16-12-2022 09:08', '16-12-2022 13:23', 'London', 'Malta', 'Boeing B738', 420);
INSERT INTO P_ZBORURI VALUES ('AV11', '14-04-2022 14:44', '14-04-2022 19:57', 'Madrid', 'Bogota', 'Boeing B788', 505);
INSERT INTO P_ZBORURI VALUES ('PU901', '05-12-2023 12:45', '05-12-2023 23:29', 'Madrid', 'Johannesburg', 'Airbus A346', 324);
INSERT INTO P_ZBORURI VALUES ('CX676', '24-12-2023 14:27', '24-12-2023 06:17', 'Tel Aviv', 'Hong Kong', 'Airbus A35K', 90);
INSERT INTO P_ZBORURI VALUES ('LY81', '10-08-2023 23:21', '11-08-2023 14:35', 'Tel Aviv', 'Bangkok', 'Boeing B772', 560);
INSERT INTO P_ZBORURI VALUES ('QR909', '07-12-2023 21:27', '08-12-2022 04:51', 'Doha Hamad', 'Sydney', 'Airbus A388', 695);
INSERT INTO P_ZBORURI VALUES ('QF24', '19-12-2023 18:57', '19-12-2023 07:34', 'Bangkok', 'Sydney', 'Airbus A333', 330);
INSERT INTO P_ZBORURI VALUES ('JL26', '28-10-2023 15:46', '28-10-2022 20:17', 'Hong Kong', 'Tokyo', 'Boeing B788', 465);
INSERT INTO P_ZBORURI VALUES ('AIF213', '15-08-2023 10:45', '16-08-2023 13:05', 'Buenos Aires', 'Lima', 'Airbus A310-325', 92);
INSERT INTO P_ZBORURI VALUES ('RO608', '03-08-2022 19:45', '03-08-2022 20:45', 'Timisoara', 'Bucharest', 'Boeing B738', 230);
INSERT INTO P_ZBORURI VALUES ('W63503', '03-08-2022 19:30', '03-08-2022 20:30', 'Timisoara', 'Frankfurt', 'Airbus A320', 365);
INSERT INTO P_ZBORURI VALUES ('W63547', '03-08-2022 10:45', '03-08-2022 11:45', 'Timisoara', 'Rome', 'Airbus A21N', 60);
--SELECT * FROM P_ZBORURI--

INSERT INTO P_CUPOANE VALUES (101, 'LH400', '09-01-2023 14:40', 'Economic', 26);
INSERT INTO P_CUPOANE VALUES (102, 'W63301', '16-12-2022 06:17', 'Business', 1);

INSERT INTO P_CUPOANE VALUES (103, 'W63479', '22-02-2023 06:21', 'Economic', 530);
INSERT INTO P_CUPOANE VALUES (103, 'CX676', '24-12-2023 14:27', 'Economic', 588);
INSERT INTO P_CUPOANE VALUES (103, 'JL26', '28-10-2023 15:46', 'Economic', 394);

INSERT INTO P_CUPOANE VALUES (104, 'W63479', '22-02-2023 06:21', 'Economic', 319);
INSERT INTO P_CUPOANE VALUES (105, 'U22295', '03-08-2022 10:40', 'Business', 5);
INSERT INTO P_CUPOANE VALUES (106, 'RO608', '03-08-2022 19:45', 'Economic', 290);
INSERT INTO P_CUPOANE VALUES (107, 'W63547', '03-08-2022 10:45', 'Economic', 567);

INSERT INTO P_CUPOANE VALUES (108, 'W63401', '28-03-2023 18:27', 'Business', 7);
INSERT INTO P_CUPOANE VALUES (108, 'AV11', '14-04-2022 14:44', 'Business', 9);

INSERT INTO P_CUPOANE VALUES (109, 'QR68', '08-06-2023 15:02', 'Economic', 166);
INSERT INTO P_CUPOANE VALUES (109, 'QR909', '07-12-2023 21:27', 'Economic', 216);

INSERT INTO P_CUPOANE VALUES (110, 'FR3882', '16-12-2022 09:08', 'Economic', 324);

INSERT INTO P_CUPOANE VALUES (111, 'W63503', '03-08-2022 19:30', 'Business', 6);
INSERT INTO P_CUPOANE VALUES (111, 'BA3385', '03-08-2022 08:45', 'Business', 7);
INSERT INTO P_CUPOANE VALUES (111, 'U22295', '03-08-2022 10:40', 'Business', 2);

INSERT INTO P_CUPOANE VALUES (112, 'CX676', '24-12-2023 14:27', 'Economic', 304);
INSERT INTO P_CUPOANE VALUES (112, 'JL26', '28-10-2023 15:46', 'Economic', 234);

INSERT INTO P_CUPOANE VALUES (113, 'LH1474', '15-12-2022 14:38', 'Business', 3);
INSERT INTO P_CUPOANE VALUES (113, 'W63479', '22-02-2023 06:21', 'Business', 10);

INSERT INTO P_CUPOANE VALUES (114, 'AIF213', '15-08-2023 10:45', 'Economic', 758);

INSERT INTO P_CUPOANE VALUES (115, 'W63301', '16-12-2022 06:17', 'Business', 1);
INSERT INTO P_CUPOANE VALUES (115, 'FR3882', '16-12-2022 09:08', 'Business', 2);

INSERT INTO P_CUPOANE VALUES (116, 'LH510', '16-11-2023 22:25', 'Economic', 145);
INSERT INTO P_CUPOANE VALUES (116, 'AIF213', '15-08-2023 10:45', 'Economic', 276);

INSERT INTO P_CUPOANE VALUES (117, 'W63479', '22-02-2023 06:21', 'Economic', 421);
INSERT INTO P_CUPOANE VALUES (117, 'LY81', '10-08-2023 23:21', 'Economic', 234);
INSERT INTO P_CUPOANE VALUES (117, 'QF24', '19-12-2023 18:57', 'Economic', 500);

INSERT INTO P_CUPOANE VALUES (118, 'LH400', '09-01-2023 14:40', 'Economic', 215);


------------------------------------------------------------|3|------------------------------------------------------------------
-------------------- a) -----------------------
SELECT clasa, sursa, destinatie FROM P_BILETE
WHERE idclient >= 100 AND idclient <= 200
ORDER BY valoare DESC, sursa;

-------------------- b) -----------------------
SELECT aparat_zbor, nr_locuri FROM P_ZBORURI
WHERE nr_locuri <= 100
ORDER BY nr_locuri DESC;


------------------------------------------------------------|4|------------------------------------------------------------------
-------------------- a) -----------------------
SELECT P_CUPOANE.nrzbor, de_la, la, TO_CHAR(P_CUPOANE.plecare,'DD-MM-YYYY HH:MI') AS PLECARE FROM P_CLIENTI 
INNER JOIN P_BILETE ON P_CLIENTI.idclient = P_BILETE.idclient
INNER JOIN P_CUPOANE ON P_CUPOANE.nrbilet = P_BILETE.nrbilet
INNER JOIN P_ZBORURI ON P_ZBORURI.nrzbor = P_CUPOANE.nrzbor
WHERE nume = 'John Doe' AND ( la = 'London' OR de_la = 'London');
--ORDER BY P_CUPOANE.nrbilet

-------------------- b) -----------------------
SELECT c1.nrbilet, c1.nrzbor "Zbor1", TO_CHAR(c1.plecare,'DD-MM-YYYY HH:MI') "Plecare1", c2.nrzbor "Zbor2", TO_CHAR(c2.plecare,'DD-MM-YYYY HH:MI') "Plecare2" 
FROM P_CUPOANE c1
CROSS JOIN P_CUPOANE c2 
WHERE c1.nrbilet = c2.nrbilet AND c1.nrzbor > c2.nrzbor;


------------------------------------------------------------|5|------------------------------------------------------------------
-------------------- a) -----------------------
SELECT nume, a.idclient, b.valoare FROM P_BILETE b
INNER JOIN P_Clienti a ON a.idclient = b.idclient
WHERE NOT EXISTS
(
    SELECT c.valoare FROM P_BILETE c 
    WHERE b.valoare > c.valoare AND b.idclient=c.idclient
    AND c.clasa = 'Business'
)
AND b.clasa = 'Business';

-------------------- b) -----------------------
SELECT nrbilet, clasa, valoare, sursa, destinatie FROM P_BILETE b
WHERE b.idclient IN 
(
    SELECT c1.idclient FROM P_CLIENTI c1 
    WHERE c1.statut = (SELECT c2.statut FROM P_CLIENTI c2 WHERE c2.nume = 'John Doe' AND c1.nume != 'John Doe')
)
AND b.destinatie = 'London';


------------------------------------------------------------|6|------------------------------------------------------------------
-------------------- a) -----------------------
SELECT z.nrzbor, COUNT(*) "Locuri Ocupate" FROM P_ZBORURI z
INNER JOIN P_CUPOANE c ON c.nrzbor = z.nrzbor
WHERE EXTRACT(YEAR FROM z.plecare) = '2022'
GROUP BY z.nrzbor;

-------------------- b) -----------------------
SELECT a.idclient, MIN(b.valoare) "Valoare minima", ROUND(AVG(b.valoare),2) "Valoare medie", MAX(b.valoare) "Valoare maxima"
FROM P_CLIENTI a INNER JOIN P_BILETE b ON a.idclient = b.idclient
GROUP BY a.idclient;


------------------------------------------------------------|7|------------------------------------------------------------------
-------------------- a) -----------------------
INSERT INTO P_CUPOANE VALUES
(123, 
    (SELECT nrzbor FROM P_ZBORURI
     WHERE nrzbor = 'AIF213' AND plecare = TO_DATE('11-10-2023 10:50', 'DD-MM-YYYY HH24:MI')),
    (SELECT plecare FROM P_ZBORURI
     WHERE nrzbor = 'AIF213' AND plecare = TO_DATE('11-10-2023 10:50', 'DD-MM-YYYY HH24:MI')),
'Economic', 89);

-------------------- b) -----------------------
DELETE FROM P_CLIENTI
WHERE idclient NOT IN 
(SELECT idclient FROM P_BILETE);

-------------------- c) -----------------------
UPDATE P_BILETE
SET valoare = valoare-valoare*0.02
WHERE nrbilet IN
(
    SELECT b.nrbilet FROM P_ZBORURI a
    INNER JOIN P_CUPOANE b ON a.nrzbor = b.nrzbor
    WHERE TO_CHAR(b.plecare, 'DD-MM-YYYY') = '03-08-2022'
    AND de_la = 'Timisoara'
);

------------------------------------------------------------|8a|------------------------------------------------------------------
CREATE OR REPLACE TRIGGER trigger_statut
AFTER DELETE OR INSERT ON P_BILETE FOR EACH ROW
DECLARE
  sumaClient P_BILETE.valoare%TYPE;
PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN 
  IF INSERTING THEN
   SELECT SUM(valoare) INTO sumaClient
   FROM P_BILETE a WHERE idclient = :NEW.idclient;
  ELSIF DELETING THEN
   SELECT SUM(valoare) INTO sumaClient
   FROM P_BILETE a WHERE idclient = :OLD.idclient;
  END IF;

  IF (sumaClient + :NEW.valoare > 1000) THEN
   UPDATE P_CLIENTI
   SET statut = 'VIP'
   WHERE idclient = :NEW.idclient;
   dbms_output.put_line('Suma ' || (sumaClient + :NEW.valoare)); 
 ELSIF (sumaClient - :OLD.valoare < 1000) THEN
   UPDATE P_CLIENTI
   SET statut = 'C'
   WHERE idclient = :OLD.idclient;
  dbms_output.put_line('Suma ' || (sumaClient - :OLD.valoare));
 END IF;
 COMMIT;
END;
/

/*
DROP TRIGGER trigger_statut

SELECT idclient, statut FROM P_CLIENTI WHERE idclient = 200;

INSERT INTO P_BILETE VALUES (170, 'Business', 100, 'A', 'B', 200); 
DELETE FROM P_BILETE WHERE nrbilet = 170
*/

------------------------------------------------------------|8b|------------------------------------------------------------------
CREATE OR REPLACE TRIGGER trigger_aparat_zbor
BEFORE UPDATE OF aparat_zbor ON P_ZBORURI FOR EACH ROW
DECLARE
  nr_cupoane int;
BEGIN
IF (:new.aparat_zbor != :OLD.aparat_zbor) THEN
  SELECT COUNT(*) into nr_cupoane FROM P_CUPOANE
  WHERE P_CUPOANE.nrzbor = :OLD.nrzbor;
  IF (nr_cupoane >= 1) THEN
    raise_application_error(-20501,'Nu puteti schimba aparatul de zbor deoarece exista deja cupoane asociate');
  END IF;
END IF;
END;
/

/*
UPDATE P_ZBORURI
SET aparat_zbor = "Airbus"
WHERE nrzbor = 'LH400' AND TO_CHAR(plecare, 'DD-MM-YYYY HH24:MI') = '09-01-2023 14:40',
*/
------------------------------------------------------------|8c|------------------------------------------------------------------
CREATE VIEW BileteVIP AS
(SELECT idclient, nume as numeclient, adresa, telefon,
nrbilet, sursa, destinatie, clasa, valoare
FROM P_CLIENTI NATURAL JOIN P_BILETE
WHERE statut = 'VIP');

CREATE OR REPLACE TRIGGER trigger_insteadof
INSTEAD OF INSERT ON BileteVIP 
FOR EACH ROW
BEGIN 
  INSERT INTO P_CLIENTI (idclient, nume, statut, adresa, telefon) VALUES (:NEW.idclient, :NEW.numeclient, 'VIP', :NEW.adresa, :NEW.telefon);
  INSERT INTO P_BILETE (nrbilet, clasa, valoare, sursa, destinatie, idclient) VALUES (:NEW.nrbilet, :NEW.clasa, :NEW.valoare, :NEW.sursa, :NEW.destinatie, :NEW.idclient);
END;


/