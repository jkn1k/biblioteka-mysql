CREATE TABLE Uczniowie (
    id_ucznia INT PRIMARY KEY,
    imie VARCHAR(50),
    nazwisko VARCHAR(50),
    klasa VARCHAR(10)
);

CREATE TABLE Oceny (
    id_oceny INT PRIMARY KEY,
    id_ucznia INT,
    przedmiot VARCHAR(50),
    ocena INT,
    FOREIGN KEY (id_ucznia) REFERENCES Uczniowie(id_ucznia)
);

SELECT U.imie, U.nazwisko, O.ocena 
FROM Uczniowie U
INNER JOIN Oceny O ON U.id_ucznia = O.id_ucznia;

SELECT U.imie, U.nazwisko, O.ocena 
FROM Uczniowie U
LEFT JOIN Oceny O ON U.id_ucznia = O.id_ucznia;

SELECT O.ocena, U.imie, U.nazwisko
FROM Uczniowie U
RIGHT JOIN Oceny O ON U.id_ucznia = O.id_ucznia;

SELECT U.imie, U.nazwisko, O.ocena 
FROM Uczniowie U
LEFT JOIN Oceny O ON U.id_ucznia = O.id_ucznia
UNION
SELECT U.imie, U.nazwisko, O.ocena 
FROM Uczniowie U
RIGHT JOIN Oceny O ON U.id_ucznia = O.id_ucznia;

SELECT U.imie, U.nazwisko, O.ocena 
FROM Uczniowie U
INNER JOIN Oceny O ON U.id_ucznia = O.id_ucznia
WHERE O.ocena > 4;

SELECT U.imie, U.nazwisko, O.ocena 
FROM Uczniowie U
INNER JOIN Oceny O ON U.id_ucznia = O.id_ucznia
WHERE O.przedmiot = 'Matematyka';