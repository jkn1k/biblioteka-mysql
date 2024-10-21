CREATE DATABASE szkola;
USE szkola;

CREATE TABLE uczniowie (
    id INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(50),
    nazwisko VARCHAR(50),
    klasa VARCHAR(10),
    wiek INT
);

CREATE TABLE nauczyciele (
    id INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(50),
    nazwisko VARCHAR(50),
    przedmiot VARCHAR(50)
);

INSERT INTO uczniowie (imie, nazwisko, klasa, wiek)
VALUES 
('Jan', 'Kowalski', '3B', 16),
('Anna', 'Nowak', '2C', 15),
('Piotr', 'Wiśniewski', '1A', 14),
('Maria', 'Zielińska', '2A', 16),
('Tomasz', 'Krawczyk', '1B', 14),
('Katarzyna', 'Mazur', '3A', 17),
('Paweł', 'Wójcik', '2B', 15);

INSERT INTO nauczyciele (imie, nazwisko, przedmiot)
VALUES 
('Adam', 'Szymański', 'Matematyka'),
('Ewa', 'Wiśniewska', 'Biologia'),
('Marek', 'Lewandowski', 'Matematyka'),
('Karolina', 'Nowicka', 'Chemia');

SELECT * FROM uczniowie;

SELECT * FROM uczniowie WHERE wiek > 15;

UPDATE uczniowie SET klasa = '2A' WHERE id = 1;
UPDATE uczniowie SET klasa = '1A' WHERE id = 2;

DELETE FROM uczniowie WHERE id = 3;

SELECT * FROM nauczyciele;

SELECT * FROM nauczyciele WHERE przedmiot = 'Matematyka';

UPDATE nauczyciele SET nazwisko = 'Kowalski' WHERE id = 2;
UPDATE nauczyciele SET nazwisko = 'Nowak' WHERE id = 3;

DELETE FROM nauczyciele WHERE id = 1;

SELECT u.imie AS imie_ucznia, u.nazwisko AS nazwisko_ucznia, u.klasa, n.imie AS imie_nauczyciela, n.nazwisko AS nazwisko_nauczyciela
FROM uczniowie u
JOIN nauczyciele n ON SUBSTRING(u.klasa, 1, 3) = SUBSTRING(n.klasa, 1, 3);