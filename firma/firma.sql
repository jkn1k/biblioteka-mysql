CREATE DATABASE firma;
USE firma;

CREATE TABLE pracownicy (
    id INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(50),
    nazwisko VARCHAR(50),
    stanowisko VARCHAR(50),
    pensja DECIMAL(10, 2)
);

INSERT INTO pracownicy (imie, nazwisko, stanowisko, pensja) VALUES
('Jan', 'Kowalski', 'Kierownik', 7000),
('Anna', 'Nowak', 'Asystent', 3500),
('Piotr', 'Wiśniewski', 'Programista', 6000),
('Ewa', 'Zielińska', 'HR Manager', 5500),
('Michał', 'Lewandowski', 'Marketing', 4800),
('Katarzyna', 'Mazur', 'Sekretarka', 3200),
('Tomasz', 'Dąbrowski', 'Analityk', 5300),
('Agnieszka', 'Kaczmarek', 'Programista', 6200),
('Robert', 'Wójcik', 'Inżynier', 5100),
('Zofia', 'Szymańska', 'Sprzedawca', 2900);

SELECT * FROM pracownicy;

SELECT * FROM pracownicy WHERE pensja > 5000;

UPDATE pracownicy SET pensja = pensja * 1.10 WHERE id = 1;

DELETE FROM pracownicy WHERE id = 3;

CREATE TABLE dzialy (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nazwa VARCHAR(50),
    id_kierownika INT
);

INSERT INTO dzialy (nazwa, id_kierownika) VALUES
('Dział IT', 1),
('Dział HR', 4),
('Dział Marketingu', 5);

SELECT pracownicy.imie, pracownicy.nazwisko, dzialy.nazwa AS nazwa_dzialu
FROM pracownicy
JOIN dzialy ON pracownicy.id = dzialy.id_kierownika;