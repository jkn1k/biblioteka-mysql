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
