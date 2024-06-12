CREATE DATABASE Cw9;
CREATE SCHEMA geology;
DROP SCHEMA IF EXISTS geology;

CREATE TABLE geology.GeoEon (
                        id_eon INTEGER PRIMARY KEY,
                        nazwa_eon VARCHAR(25) NOT NULL
);

CREATE TABLE geology.GeoEra (
                        id_era INTEGER PRIMARY KEY,
                        id_eon INTEGER REFERENCES geology.GeoEon(id_eon),
                        nazwa_era VARCHAR(25) NOT NULL
);

CREATE TABLE geology.GeoOkres (
                          id_okres INTEGER PRIMARY KEY,
                          id_era INTEGER REFERENCES geology.GeoEra(id_era),
                          nazwa_okres VARCHAR(25) NOT NULL
);

CREATE TABLE geology.GeoEpoka (
                          id_epoka INTEGER PRIMARY KEY,
                          id_okres INTEGER REFERENCES geology.GeoOkres(id_okres),
                          nazwa_epoka VARCHAR(25) NOT NULL
);

CREATE TABLE geology.GeoPietro (
                           id_pietro INTEGER PRIMARY KEY,
                           id_epoka INTEGER REFERENCES geology.GeoEpoka(id_epoka),
                           nazwa_p VARCHAR(25) NOT NULL
);

ALTER TABLE geology.GeoEra
    ADD FOREIGN KEY (id_eon) REFERENCES geology.GeoEon (id_eon);


ALTER TABLE geology.GeoOkres
    ADD FOREIGN KEY (id_era) REFERENCES geology.GeoEra (id_era);

ALTER TABLE geology.GeoEpoka
    ADD FOREIGN KEY (id_okres) REFERENCES geology.GeoOkres (id_okres);

ALTER TABLE geology.GeoPietro
    ADD FOREIGN KEY (id_epoka) REFERENCES geology.GeoEpoka (id_epoka);



INSERT INTO geology.GeoEon VALUES
    (1, 'Fanerozoik');

INSERT INTO geology.GeoEra VALUES
                       (1, 1, 'Kenozoik'),
                       (2, 1, 'Mezozoik'),
                       (3, 1, 'Paleozoik');

INSERT INTO geology.GeoOkres VALUES
                         (1, 1, 'Czwartorz�d'),
                         (2, 1, 'Neogen'),
                         (3, 1, 'Paleogen'),
                         (4, 2, 'Kreda'),
                         (5, 2, 'Jura'),
                         (6, 2, 'Trias'),
                         (7, 3, 'Perm'),
                         (8, 3, 'Karbon'),
                         (9, 3, 'Dewon');

INSERT INTO geology.GeoEpoka VALUES
                         (1, 1, 'Holocen'),
                         (2, 1, 'Plejstocen'),
                         (3, 2, 'Pliocen'),
                         (4, 2, 'Miocen'),
                         (5, 3, 'Oligocen'),
                         (6, 3, 'Eocen'),
                         (7, 3, 'Paleocen'),
                         (8, 4, 'P�na kreda'),
                         (9, 4, 'Wczesna kreda'),
                         (10, 5, 'Jura p�na'),
                         (11, 5, 'Jura �rodkowa'),
                         (12, 5, 'Jura wczesna'),
                         (13, 6, 'P�ny trias'),
                         (14, 6, '�rodkowy trias'),
                         (15, 6, 'Wczesny trias'),
                         (16, 7, 'P�ny perm'),
                         (17, 7, 'Wczesny perm'),
                         (18, 8, 'P�ny karbon'),
                         (19, 8, 'Wczesny karbon'),
                         (20, 9, 'P�ny dewon'),
                         (21, 9, '�rodkowy dewon'),
                         (22, 9, 'Dolny dewon');

INSERT INTO geology.GeoPietro VALUES
                          (1,1,'megalaj'),
                          (2,1,'northgrip'),
                          (3,1,'grenland'),
                          (4,2,'p�ny'),
                          (5,2,'chiban'),
                          (6,2,'kalabr'),
                          (7,2,'gelas'),
                          (8,3,'piacent'),
                          (9,3,'zankl'),
                          (10,4,'messyn'),
                          (11,4,'torton'),
                          (12,4,'serrawal'),
                          (13,4,'lang'),
                          (14,4,'burdyga�'),
                          (15,4,'akwitan'),
                          (16,5,'szat'),
                          (17,5,'rupel'),
                          (18,6,'priabon'),
                          (19,6,'barton'),
                          (20,6,'lutet'),
                          (21,6,'iprez'),
                          (22,7,'tanet'),
                          (23,7,'zeland'),
                          (24,7,'dan'),
                          (25,8,'mastrycht'),
                          (26,8,'kampan'),
                          (27,8,'santon'),
                          (28,8,'koniak'),
                          (29,8,'turon'),
                          (30,8,'cenoman'),
                          (31,9,'alb'),
                          (32,9,'apt'),
                          (33,9,'barrem'),
                          (34,9,'hoteryw'),
                          (35,9,'walan�yn'),
                          (36,9,'berrias'),
                          (37,10,'tyton'),
                          (38,10,'kimeryd'),
                          (39,10,'oksford'),
                          (40,11,'kelowej'),
                          (41,11,'baton'),
                          (42,11,'bajos'),
                          (43,11,'aalen'),
                          (44,12,'toark'),
                          (45,12,'pliensbach'),
                          (46,12,'synemur'),
                          (47,12,'hettang'),
                          (48,13,'retyk'),
                          (49,13,'noryk'),
                          (50,13,'karnik'),
                          (51,14,'ladyn'),
                          (52,14,'anizyk'),
                          (53,15,'olenek'),
                          (54,15,'ind'),
                          (55,16,'czangsing'),
                          (56,16,'wucziaping'),
                          (57,16,'kapitan'),
                          (58,16,'word'),
                          (59,16,'road'),
                          (60,17,'kungur'),
                          (61,17,'artinsk'),
                          (62,17,'sakmar'),
                          (63,17,'assel'),
                          (64,18,'g�el'),
                          (65,18,'kasimow'),
                          (66,18,'moskow'),
                          (67,18,'baszkir'),
                          (68,19,'serpuchow'),
                          (69,19,'wizen'),
                          (70,19,'turnej'),
                          (71,20,'famen'),
                          (72,20,'fran'),
                          (73,21,'�ywet'),
                          (74,21,'eifel'),
                          (75,22,'ems'),
                          (76,22,'prag'),
                          (77,22,'lochkow');


CREATE TABLE GeoTabela AS (SELECT * FROM geology.GeoPietro NATURAL JOIN geology.GeoEpoka NATURAL JOIN geology.GeoOkres NATURAL JOIN geology.GeoEra NATURAL JOIN geology.GeoEon);

CREATE TABLE Dziesiec(
                         cyfra int,
                         bit int
);

INSERT INTO Dziesiec VALUES
                         (0, 1),
                         (1, 1),
                         (2, 1),
                         (3, 1),
                         (4, 1),
                         (5, 1),
                         (6, 1),
                         (7, 1),
                         (8, 1),
                         (9, 1);

CREATE TABLE Milion(liczba int,cyfra int, bit int);
INSERT INTO  Milion SELECT a1.cyfra +10* a2.cyfra +100*a3.cyfra + 1000*a4.cyfra
                               + 10000*a5.cyfra + 10000*a6.cyfra AS liczba , a1.cyfra AS cyfra, a1.bit AS bit
FROM Dziesiec a1, Dziesiec a2, Dziesiec a3, Dziesiec a4, Dziesiec a5, Dziesiec a6 ;

ALTER TABLE GeoTabela ADD PRIMARY KEY(id_pietro);
SELECT * FROM GeoTabela;

-- pierwszy etap
CREATE INDEX id_pietro_index ON GeoTabela(id_pietro);
CREATE INDEX id_eon_index ON geology.GeoEon(id_eon);
CREATE INDEX id_era_index ON geology.GeoEra(id_era);
CREATE INDEX id_okres_index ON geology.GeoOkres(id_okres);
CREATE INDEX id_epoka_index ON geology.GeoEpoka(id_epoka);
CREATE INDEX id_pietro_index ON geology.GeoPietro(id_pietro);

-- 1ZL
SELECT COUNT(*) FROM Milion INNER JOIN GeoTabela ON (mod(Milion.liczba,77)=(GeoTabela.id_pietro));

-- 2ZL
SELECT COUNT(*) FROM Milion INNER JOIN  geology.GeoPietro  ON
    (mod(Milion.liczba,77)=GeoPietro.id_pietro) NATURAL JOIN geology.GeoEpoka NATURAL JOIN
                     geology.GeoOkres NATURAL JOIN geology.GeoEra NATURAL JOIN geology.GeoEon;

-- 3ZG
SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba,77)= (SELECT id_pietro FROM GeoTabela
                                                          WHERE mod(Milion.liczba,77)=(id_pietro));

-- 4 ZG
SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba,77)
                                      IN (SELECT geology.GeoPietro.id_pietro FROM geology.GeoPietro
                                                                              NATURAL JOIN geology.GeoEpoka NATURAL JOIN
                                                                                  geology.GeoOkres NATURAL JOIN geology.GeoEra NATURAL JOIN geology.GeoEon);




-- drugi etap
CREATE INDEX nazwa_eon_index ON geology.GeoEon(nazwa_eon);
CREATE INDEX nazwa_era_index ON geology.GeoEra(nazwa_era);
CREATE INDEX nazwa_okres_index ON geology.GeoOkres(nazwa_okres);
CREATE INDEX nazwa_epoka_index ON geology.GeoEpoka(nazwa_epoka);
CREATE INDEX nazwa_p_index ON geology.GeoPietro(nazwa_p);
CREATE INDEX id_eongi ON geology.GeoEra(id_eon);
CREATE INDEX id_eragi ON geology.GeoOkres(id_era);
CREATE INDEX id_okregi ON geology.GeoEpoka(id_okres);
CREATE INDEX id_epokagi ON geology.GeoPietro(id_epoka);


-- 1ZL
SELECT COUNT(*) FROM Milion INNER JOIN GeoTabela ON (mod(Milion.liczba,77)=(GeoTabela.id_pietro));

-- 2ZL
SELECT COUNT(*) FROM Milion INNER JOIN  geology.GeoPietro  ON
    (mod(Milion.liczba,77)=GeoPietro.id_pietro) NATURAL JOIN geology.GeoEpoka NATURAL JOIN
                     geology.GeoOkres NATURAL JOIN geology.GeoEra NATURAL JOIN geology.GeoEon;

-- 3ZG
SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba,77)= (SELECT id_pietro FROM GeoTabela
                                                          WHERE mod(Milion.liczba,77)=(id_pietro));

-- 4ZG
SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba,77)
                                      IN (SELECT geology.GeoPietro.id_pietro FROM geology.GeoPietro
                                                                              NATURAL JOIN geology.GeoEpoka NATURAL JOIN
                                                                                  geology.GeoOkres NATURAL JOIN geology.GeoEra NATURAL JOIN geology.GeoEon);




