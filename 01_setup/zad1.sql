CREATE DATABASE firma;
CREATE SCHEMA ksiegowosc;

CREATE TABLE ksiegowosc.pracownicy (
    id_pracownika SERIAL PRIMARY KEY,
    imie VARCHAR(30) NOT NULL,
    nazwisko VARCHAR(40) NOT NULL,
    adres VARCHAR(100),
    telefon VARCHAR(15)
) COMMENT = 'tabela z informacjami o pracownikach';

CREATE TABLE ksiegowosc.godziny (
    id_godziny SERIAL PRIMARY KEY,
    data DATE NOT NULL,
    liczba_godzin NUMERIC(5,2) NOT NULL,
    id_pracownika INT REFERENCES ksiegowosc.pracownicy(id_pracownika)
) COMMENT = 'tabela z godzinami przepracowanymi przez pracownikow';


CREATE TABLE ksiegowosc.pensja (
    id_pensji SERIAL PRIMARY KEY,
    stanowisko VARCHAR(50) NOT NULL,
    kwota NUMERIC(10,2) NOT NULL
) COMMENT = 'tabela z informacjami o pensjach' ;


CREATE TABLE ksiegowosc.premia (
    id_premii SERIAL PRIMARY KEY,
    rodzaj VARCHAR(50),
    kwota NUMERIC(10,2)
) COMMENT = 'tabela z informacjami o premiach';


CREATE TABLE ksiegowosc.wynagrodzenie (
    id_wynagrodzenia SERIAL PRIMARY KEY,
    data DATE NOT NULL,
    id_pracownika INT REFERENCES ksiegowosc.pracownicy(id_pracownika),
    id_godziny INT REFERENCES ksiegowosc.godziny(id_godziny),
    id_pensji INT REFERENCES ksiegowosc.pensja(id_pensji),
    id_premii INT REFERENCES ksiegowosc.premia(id_premii)
) COMMENT = 'tabela z informacjami o pensjach';



INSERT INTO ksiegowosc.pracownicy (imie, nazwisko, adres, telefon) VALUES
('Jan', 'Nowak', 'Warszawa, ul. Polna 1', '501001001'),
('Anna', 'Kowalska', 'Kraków, ul. Lipowa 3', '501002002'),
('Jakub', 'Wiśniewski', 'Poznań, ul. Różana 5', '501003003'),
('Joanna', 'Lewandowska', 'Gdańsk, ul. Słoneczna 7', '501004004'),
('Krzysztof', 'Wójcik', 'Łódź, ul. Długa 9', '501005005'),
('Julia', 'Kamińska', 'Lublin, ul. Parkowa 2', '501006006'),
('Michał', 'Zieliński', 'Katowice, ul. Mickiewicza 8', '501007007'),
('Karolina', 'Kaczmarek', 'Szczecin, ul. Leśna 4', '501008008'),
('Jacek', 'Mazur', 'Warszawa, ul. Krótka 6', '501009009'),
('Natalia', 'Pawlak', 'Wrocław, ul. Jesionowa 10', '501010010');

INSERT INTO ksiegowosc.pensja (stanowisko, kwota) VALUES
('Kierownik', 5000),
('Specjalista', 3200),
('Asystent', 2200),
('Księgowy', 4000),
('Magazynier', 2500),
('Sprzedawca', 2800),
('Recepcjonista', 2100),
('Analityk', 3500),
('Technik', 2600),
('Praktykant', 1200);

INSERT INTO ksiegowosc.premia (rodzaj, kwota) VALUES
('Brak', 0),
('Motywacyjna', 500),
('Roczna', 1000),
('Za nadgodziny', 700),
('Brak', 0),
('Specjalna', 800),
('Brak', 0),
('Motywacyjna', 600),
('Brak', 0),
('Roczna', 1200);

INSERT INTO ksiegowosc.godziny (data, liczba_godzin, id_pracownika) VALUES
('2025-10-01', 170, 1),
('2025-10-01', 160, 2),
('2025-10-01', 180, 3),
('2025-10-01', 150, 4),
('2025-10-01', 165, 5),
('2025-10-01', 155, 6),
('2025-10-01', 175, 7),
('2025-10-01', 160, 8),
('2025-10-01', 190, 9),
('2025-10-01', 140, 10);

INSERT INTO ksiegowosc.wynagrodzenie (data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES
('2025-10-01', 1, 1, 1, 2),
('2025-10-01', 2, 2, 2, 1),
('2025-10-01', 3, 3, 4, 3),
('2025-10-01', 4, 4, 3, 1),
('2025-10-01', 5, 5, 5, 4),
('2025-10-01', 6, 6, 6, 5),
('2025-10-01', 7, 7, 8, 6),
('2025-10-01', 8, 8, 7, 7),
('2025-10-01', 9, 9, 9, 1),
('2025-10-01', 10, 10, 10, 1);

--a
SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;
--b
SELECT w.id_pracownika
FROM ksiegowosc.wynagrodzenie w
JOIN ksiegowosc.pensja p ON w.id_pensji = p.id_pensji
WHERE p.kwota > 1000;
--c
SELECT w.id_pracownika
FROM ksiegowosc.wynagrodzenie w
JOIN ksiegowosc.pensja p ON w.id_pensji = p.id_pensji
JOIN ksiegowosc.premia pr ON w.id_premii = pr.id_premii
WHERE pr.kwota = 0 AND p.kwota > 2000;
--d
SELECT * FROM ksiegowosc.pracownicy WHERE imie LIKE 'J%';
--e
SELECT * FROM ksiegowosc.pracownicy
WHERE nazwisko LIKE '%n%' AND imie LIKE '%a';
--f
SELECT p.imie, p.nazwisko, 
       (g.liczba_godzin - 160) AS nadgodziny
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.godziny g ON p.id_pracownika = g.id_pracownika;
--g
SELECT p.imie, p.nazwisko, s.kwota
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensja s ON w.id_pensji = s.id_pensji
WHERE s.kwota BETWEEN 1500 AND 3000;
--h
SELECT p.imie, p.nazwisko
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.godziny g ON p.id_pracownika = g.id_pracownika
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.premia pr ON w.id_premii = pr.id_premii
WHERE g.liczba_godzin > 160 AND pr.kwota = 0;
--i
SELECT p.imie, p.nazwisko, s.kwota
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensja s ON w.id_pensji = s.id_pensji
ORDER BY s.kwota;
--j
SELECT p.imie, p.nazwisko, s.kwota AS pensja, pr.kwota AS premia
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensja s ON w.id_pensji = s.id_pensji
JOIN ksiegowosc.premia pr ON w.id_premii = pr.id_premii
ORDER BY s.kwota DESC, pr.kwota DESC;
--k
SELECT s.stanowisko, COUNT(*) AS liczba_pracownikow
FROM ksiegowosc.wynagrodzenie w
JOIN ksiegowosc.pensja s ON w.id_pensji = s.id_pensji
GROUP BY s.stanowisko;
--l
SELECT 
    s.stanowisko,
    AVG(s.kwota) AS srednia,
    MIN(s.kwota) AS minimalna,
    MAX(s.kwota) AS maksymalna
FROM ksiegowosc.pensja s
WHERE s.stanowisko = 'Kierownik'
GROUP BY s.stanowisko;
--m
SELECT SUM(p.kwota + pr.kwota) AS suma_wszystkich_wynagrodzen
FROM ksiegowosc.wynagrodzenie w
JOIN ksiegowosc.pensja p ON w.id_pensji = p.id_pensji
JOIN ksiegowosc.premia pr ON w.id_premii = pr.id_premii;
--f
SELECT s.stanowisko, SUM(s.kwota + pr.kwota) AS suma_wynagrodzen
FROM ksiegowosc.wynagrodzenie w
JOIN ksiegowosc.pensja s ON w.id_pensji = s.id_pensji
JOIN ksiegowosc.premia pr ON w.id_premii = pr.id_premii
GROUP BY s.stanowisko;
--g
SELECT s.stanowisko, COUNT(pr.id_premii) AS liczba_premii
FROM ksiegowosc.wynagrodzenie w
JOIN ksiegowosc.pensja s ON w.id_pensji = s.id_pensji
JOIN ksiegowosc.premia pr ON w.id_premii = pr.id_premii
WHERE pr.kwota > 0
GROUP BY s.stanowisko;
--h
DELETE FROM ksiegowosc.wynagrodzenie
WHERE id_pracownika IN (
    SELECT w.id_pracownika
    FROM ksiegowosc.wynagrodzenie w
    JOIN ksiegowosc.pensja s ON w.id_pensji = s.id_pensji
    WHERE s.kwota < 1200
);
DELETE FROM ksiegowosc.pracownicy
WHERE id_pracownika NOT IN (SELECT id_pracownika FROM ksiegowosc.wynagrodzenie);


