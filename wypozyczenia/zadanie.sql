CREATE DATABASE biblioteka;

USE biblioteka;

CREATE TABLE ksiazki (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tytul VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    rok_wydania YEAR NOT NULL,
    cena DECIMAL(10, 2) NOT NULL
);

ALTER TABLE ksiazki
ADD COLUMN gatunek VARCHAR(100),
ADD COLUMN isbn VARCHAR(20),
ADD COLUMN opis TEXT;

CREATE TABLE czytelnicy (
    id INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(100),
    nazwisko VARCHAR(100),
    data_rejestracji DATE
);

CREATE TABLE wypozyczenia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    czytelnik_id INT NOT NULL,
    ksiazka_id INT NOT NULL,
    data_wypozyczenia DATE NOT NULL,
    data_zwrotu DATE NOT NULL,
    FOREIGN KEY (czytelnik_id) REFERENCES czytelnicy(id),
    FOREIGN KEY (ksiazka_id) REFERENCES ksiazki(id)
);

INSERT INTO ksiazki (tytul, autor, rok_wydania, cena) VALUES
('Książka 1', 'Autor abc', 1985, 139.99),
('Książka 2', 'Autor xyz', 1995, 349.99),
('Książka 3', 'Autor qwe', 2005, 429.99);

INSERT INTO czytelnicy (imie, nazwisko, data_rejestracji) VALUES
('Adam', 'Kowalski', 2010-10-29),
('Karol', 'Wiśniewski', 2020-12-13),
('Jan', 'Nowak', 2008-05-10),

INSERT INTO wypozyczenia (czytelnik_id, ksiazka_id, data_wypozyczenia, data_zwrotu) VALUES
(1, 1, 2012-08-03, 2012-12-23),
(2, 2, 2020-12-13, 2023-03-01),
(3, 3, 2009-05-05, 2011-05-05);


CREATE INDEX idx_autor ON ksiazki(autor);

CREATE VIEW widok_wypozyczen AS
SELECT 
    k.tytul AS tytul_ksiazki,
    c.imie,
    c.nazwisko,
    w.data_wypozyczenia
FROM 
    wypozyczenia w
JOIN 
    ksiazki k ON w.ksiazka_id = k.id
JOIN 
    czytelnicy c ON w.czytelnik_id = c.id;

DELIMITER //

CREATE PROCEDURE DodajWypozyczenie(IN p_czytelnik_id INT, IN p_ksiazka_id INT)
BEGIN
    INSERT INTO wypozyczenia (czytelnik_id, ksiazka_id, data_wypozyczenia) 
    VALUES (p_czytelnik_id, p_ksiazka_id, CURDATE());
END //

DELIMITER ;