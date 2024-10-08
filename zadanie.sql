CREATE DATABASE biblioteka;

USE biblioteka;

CREATE TABLE ksiazki (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tytul VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    rok_wydania INT NOT NULL,
    cena DECIMAL(10, 2) NOT NULL
);

INSERT INTO ksiazki (tytul, autor, rok_wydania, cena) VALUES
('Książka 1', 'Autor abc', 1985, 139.99),
('Książka 2', 'Autor xyz', 1995, 349.99),
('Książka 3', 'Autor qwe', 2005, 429.99);

SELECT * FROM ksiazki;

SELECT * FROM ksiazki WHERE rok_wydania > 1990;

UPDATE ksiazki SET cena = 324.99 WHERE tytul = 'Książka 3';

DELETE FROM ksiazki WHERE tytul = 'Książka 3';

-- Zadanie 3

CREATE TABLE czytelnicy (
    id INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(100),
    nazwisko VARCHAR(100),
    data_rejestracji DATE
);

CREATE TABLE wypozyczenia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    czytelnik_id INT,
    ksiazka_id INT,
    data_wypozyczenia DATE,
    data_zwrotu DATE,
    FOREIGN KEY (czytelnik_id) REFERENCES czytelnicy(id),
    FOREIGN KEY (ksiazka_id) REFERENCES ksiazki(id)
);

ALTER TABLE ksiazki
ADD COLUMN gatunek VARCHAR(100),
ADD COLUMN isbn VARCHAR(20),
ADD COLUMN opis TEXT;

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
