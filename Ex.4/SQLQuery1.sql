CREATE DATABASE firma;

USE firma;
GO
CREATE SCHEMA rozliczenia;
GO

CREATE TABLE rozliczenia.pracownicy (
    id_pracownika INT PRIMARY KEY,
    imie VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL,
    adres VARCHAR(100),
    telefon VARCHAR(20) NOT NULL
);

CREATE TABLE rozliczenia.godziny (
    id_godziny INT PRIMARY KEY,
    data_ DATE NOT NULL,
    liczba_godzin INT NOT NULL,
    id_pracownika int NOT NULL
);

CREATE TABLE rozliczenia.pensje
(
    id_pensji int PRIMARY KEY,
    stanowisko varchar(50) NOT NULL,
    kwota decimal(10,2) NOT NULL,
    id_premii int NOT NULL
);

CREATE TABLE rozliczenia.premie
(
    id_premii int PRIMARY KEY,
    rodzaj varchar(50) NOT NULL,
    kwota decimal(10,2) NOT NULL
);

GO

ALTER TABLE rozliczenia.godziny
ADD CONSTRAINT FK_godziny_pracownicy FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika);

GO

ALTER TABLE rozliczenia.pensje
ADD CONSTRAINT FK_pensje_premie FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);

GO

INSERT INTO rozliczenia.pracownicy (id_pracownika, imie, nazwisko, adres, telefon)
VALUES
(1, 'Adam', 'Nowicki', 'ul. Lipowa 11, Poznañ', '111222333'),
(2, 'Monika', 'Kowal', 'ul. Kwiatowa 12, Warszawa', '444555666'),
(3, 'Jakub', 'Nowakowski', 'ul. Leœna 13, Gdañsk', '777888999'),
(4, 'Patrycja', 'Zawadzka', 'ul. Rycerska 14, Kraków', '000111222'),
(5, 'Krzysztof', 'Adamczyk', 'ul. Zielona 15, Wroc³aw', '333444555'),
(6, 'Martyna', 'WoŸniak', 'ul. S³oneczna 16, £ódŸ', '666777888'),
(7, 'Miko³aj', 'Wójcik', 'ul. Cicha 17, Szczecin', '999000111'),
(8, 'Dominika', 'Jankowska', 'ul. Ogrodowa 18, Lublin', '222333444'),
(9, 'Sebastian', 'Kaczmarek', 'ul. Weso³a 19, Katowice', '555666777'),
(10, 'Kamila', 'Piotrowska', 'ul. Polna 20, Gdynia', '888999000');

GO

INSERT INTO rozliczenia.godziny (id_godziny, data_, liczba_godzin, id_pracownika)
VALUES
(1, '2024-04-1', 8, 1),
(2, '2024-04-2', 7, 2),
(3, '2024-04-3', 9, 3),
(4, '2024-04-4', 8, 4),
(5, '2024-04-5', 7, 5),
(6, '2024-04-6', 8, 6),
(7, '2024-04-7', 7, 7),
(8, '2024-04-8', 9, 8),
(9, '2024-04-9', 8, 9),
(10, '2024-04-10', 7, 10);

GO

INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota)
VALUES
(1, 'Premia za innowacje', 800),
(2, 'Premia za zaanga¿owanie', 650),
(3, 'Premia za wydajnoœæ', 900),
(4, 'Premia za œwiêta', 550),
(5, 'Premia za doskona³oœæ', 1000),
(6, 'Premia za lojalnoœæ', 750),
(7, 'Premia za dodatkowy wysi³ek', 600),
(8, 'Premia jubileuszowa', 350),
(9, 'Premia za jakoœæ pracy', 700),
(10, 'Premia za elastycznoœæ', 450);

GO

INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii)
VALUES
(1, 'Specjalista ds. HR', 4200, NULL),
(2, 'Administrator baz danych', 5500, NULL),
(3, 'Specjalista ds. obs³ugi klienta', 3200, NULL),
(4, 'Technik serwisowy', 4800, NULL),
(5, 'Projektant wnêtrz', 7000, 3),
(6, 'Kierowca dostawca', 3800, NULL),
(7, 'Konsultant handlowy', 4600, NULL),
(8, 'Analityk systemowy', 6200, 2),
(9, 'Asystent biura', 3500, NULL),
(10, 'Operator produkcji', 4000, NULL);

