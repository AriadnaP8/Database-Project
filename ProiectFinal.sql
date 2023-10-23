DROP TABLE Distributie;
DROP TABLE Studio;
DROP TABLE Film;
DROP TABLE Persoana;

--Creez tabelele pe rand, fiecare in parte cu fiecare coloana
--subpunctul a)
CREATE TABLE Film(
    titlu VARCHAR(30),
    an NUMBER,
    durata NUMBER,
    gen VARCHAR(30),
    studio VARCHAR(30),
    id_producator NUMBER);

--subpunctul b)
CREATE TABLE Distributie(
    titlu_film VARCHAR(30),
    an_film NUMBER,
    id_actor NUMBER);

--subpunctul c)
CREATE TABLE Persoana(
    id_persoana NUMBER,
    nume VARCHAR(20),
    adresa VARCHAR(50),
    sex CHARACTER,
    data_nasterii DATE,
    castig_net NUMBER,
    moneda VARCHAR(3));

--subpunctul d)
CREATE TABLE Studio(
    nume VARCHAR(25),
    adresa VARCHAR(60),
    tara VARCHAR(30),
    id_presedinte NUMBER);

--subpunctul e)
--primary key din tabelul film
ALTER TABLE Film
ADD CONSTRAINT f_titlu_an PRIMARY KEY(titlu, an);
--primary key din tabelul persoana
ALTER TABLE Persoana 
ADD CONSTRAINT p_id_persoana PRIMARY KEY(id_persoana);
--foreign key din tabelul film
ALTER TABLE Film
ADD CONSTRAINT f_id_producator FOREIGN KEY(id_producator) REFERENCES Persoana(id_persoana);

--foreign key din tabelul distributie
ALTER TABLE Distributie
ADD CONSTRAINT d_id_actor FOREIGN KEY(id_actor) REFERENCES Persoana(id_persoana);
ALTER TABLE Distributie 
ADD CONSTRAINT f_an FOREIGN KEY(titlu_film,an_film) REFERENCES Film(titlu,an);
--foreign key din tabelul studio
ALTER TABLE Studio
ADD CONSTRAINT s_id_presedinte FOREIGN KEY(id_presedinte) REFERENCES Persoana(id_persoana);
--coloana studio din tabele film reprezinta numele unui studio
ALTER TABLE Studio
ADD CONSTRAINT s_nume PRIMARY KEY(nume);

--constraint pentru sexul care poate fi doar F sau M
ALTER TABLE Persoana 
ADD CONSTRAINT p_sex CHECK(sex = 'M' OR sex = 'F');

--constraint pentru genul care poate fi doar‘drama’,‘comedie’, ‘SF’ sau ‘copii’.
ALTER TABLE Film 
ADD CONSTRAINT f_gen CHECK(gen LIKE 'drama' OR gen LIKE 'comedie' OR gen LIKE 'SF' or gen LIKE 'copii');

--constraint pentru moneda care poate fi 'USD', 'EUR', 'GBP'
ALTER TABLE Persoana 
ADD CONSTRAINT p_moneda CHECK(moneda LIKE 'USD' OR moneda LIKE 'EUR' OR moneda LIKE 'GBP');

---------------------------------------------------------INSERARE DATE-------------------------------------------------------------
---------------------------------FILME DRAMA
--presedinte studio
INSERT INTO Persoana VALUES(1, 'Jerome Seydoux', 'Paris 16th, Franta', 'M', '21-Sep-1934', 80000, 'EUR');
--producator film
INSERT INTO Persoana VALUES(2, 'Philippe Rousselet', 'Briey, Meurthe-et-Moselle, France', 'M', '04-Sep-1945', 350000, 'EUR');
--actor film
INSERT INTO Persoana VALUES(3, 'Emilia Jones', 'Westminster,, London, England', 'F', '23-Feb-2002', 35000, 'EUR');
INSERT INTO Film VALUES('CODA', 2021, 111, 'drama', 'Pathe Films', 2);
INSERT INTO Studio VALUES('Pathe Films', 'Pathe La Villette, Paris', 'Franta', 1);
INSERT INTO Distributie VALUES('CODA', 2021, 3);

--actor jocker
INSERT INTO Persoana VALUES(4, 'Juaquin Pheonix', 'Rio Piedras, Puerto Rico', 'M', '28-Oct-1947', '1000000', 'USD');
--presedinte warner bros
INSERT INTO Persoana VALUES(5, 'Jack L. Warner', 'Londra, Ontario, Canada', 'M', '02-Aug-1950', 2000000, 'USD');
--producator joker
INSERT INTO Persoana VALUES(6, 'Bradley Cooper', 'Philadelphia, Pennsylvania, USA', 'M', '05-Jan-1975', 80000000, 'USD');

INSERT INTO Film VALUES('Joker', 2019, 122, 'drama', 'Warner Bros.', 6);

INSERT INTO Studio VALUES('Warner Bros.', 'Burbank, California', 'USA', 5);
INSERT INTO Distributie VALUES('Joker', 2019, 4);
--actor the father
INSERT INTO Persoana VALUES(7, 'Anthony Hopkins', 'Port Talbot, Glamorgan, Wales', 'M', '31-Dec-1937', '12000000', 'GBP');
--presedinte West London Film Studios
INSERT INTO Persoana VALUES(8, 'Frank Khalid', 'Newham, London', 'M', '22-Nov-1968', '8800000', 'GBP');
--producator/director the father
INSERT INTO Persoana VALUES(9, 'Florian Zeller', 'Paris, France', 'M', '28-Jun-1979', '9750000', 'GBP'); 

INSERT INTO Film VALUES('The Father', 2020, 97, 'drama', 'West London Film Studios', 9);
INSERT INTO Studio VALUES('West London Film Studios', 'SpringField Road, Hayes, Middlesex, London', 'United Kingdom', 7);
INSERT INTO Distributie VALUES('The Father', 2020, 8);


---------------------------------FILME COMEDIE
--actori stan and ollie
INSERT INTO Persoana VALUES(10, 'Steve Coogan', 'Port Talbot, Glamorgan, Wales', 'M', '31-Dec-1937', '4000000', 'GBP');
INSERT INTO Persoana VALUES(26, 'John C. Reilly', 'Chicago, Illinois, United States', 'M', '24-May-1965', '1870000', 'GBP');

--producator/director stan and ollie
INSERT INTO Persoana VALUES(12, 'Jon S. Baird', 'Peterhead, Aberdeenshire, Scotland', 'M', '09-Nov-1972', '9050000', 'GBP'); 
INSERT INTO Film VALUES('Stan and Ollie', 2018, 98, 'comedie', 'West London Film Studios', 12);
INSERT INTO Distributie VALUES('Stan and Ollie', 2018, 10);
INSERT INTO Distributie VALUES('Stan and Ollie', 2018, 26);  

--actor si director/producator teambuilding
INSERT INTO Persoana VALUES(13, 'Matei Dima', 'Constanta, Romania', 'M', '19-Jun-1987', '150000', 'EUR');
--presedinte West London Film Studios
INSERT INTO Persoana VALUES(14, 'Alexandra Hash', 'Bucuresti, Romania', 'F', '09-Mar-1985', '800000', 'EUR');

INSERT INTO Film VALUES('Teambuilding', 2022, 91, 'comedie', 'Vidra Productions', 13);
INSERT INTO Studio VALUES('Vidra Productions', 'Str. Putul lui Zamfir, Sector 1, Bucuresti', 'Romania', 14);
INSERT INTO Distributie VALUES('Teambuilding', 2022, 13);

INSERT INTO Persoana VALUES(15, 'Ryan Reynolds', 'Washington', 'M', '23-OCT-1976', 350000, 'USD');
INSERT INTO Film VALUES('Free Guy', 2021, 115, 'comedie', 'Berlanti Productions', 15);
INSERT INTO Studio VALUES('Berlanti Productions', 'Hollywood', 'SUA', 15);
INSERT INTO DISTRIBUTIE VALUES('Free Guy', 2021, 15);

----------------------------------FILME Copii
--actori frozen
INSERT INTO Persoana VALUES(16, 'Kristen Bell', 'Huntington Woods, Michigan, United States', 'F', '18-Jul-1980', '500000', 'USD');
INSERT INTO Persoana VALUES(23, 'Josh Gad', 'Hollywood, Florida, USA', 'M', '23-Feb-1981', '890000', 'USD');
--producator frozen
INSERT INTO Persoana VALUES(17, 'Jennifere Lee', 'East Providence, Rhode Island, United States', 'F', '22-Oct-1971', '8880000', 'USD');
--presedinte Walt Disney Pictures
INSERT INTO Persoana VALUES(18, 'Sean Bailey', 'California, SUA', 'M', '08-Apr-1970', '80000000', 'USD');

INSERT INTO Film VALUES('Frozen', 2013, 108, 'copii', 'Walt Disney Pictures', 17);
INSERT INTO Studio VALUES('Walt Disney Pictures', '500 South Buena Vista Street, Burbank, California', 'SUA', 18);
INSERT INTO Distributie VALUES('Frozen', 2013, 16);
INSERT INTO Distributie VALUES('Frozen', 2013, 23);
                            
--actor
INSERT INTO Persoana VALUES(19, 'Kristen Bell', 'Huntington Woods, Michigan, United States', 'F', '18-Jul-1980', '500000', 'USD');
--producator
INSERT INTO Persoana VALUES(20, 'Karen Gilchrist', 'Michigan, United States', 'F', '10-Jul-1980', '500000', 'USD');

INSERT INTO Film VALUES('The Lion King', 2019, 118, 'copii', 'Walt Disney Pictures', 20);
INSERT INTO Distributie VALUES('The Lion King', 2019, 19);

INSERT INTO Persoana VALUES(21, 'Thomas Jeffrey Hanks', 'Concord, California, USA', 'M', '09-Jul-1956', '254000', 'USD');
INSERT INTO Persoana VALUES(27, 'John Alan Lasseter', 'Hollywood, California, USA', 'M', '12-Jan-1957', '321000', 'USD');

INSERT INTO Film VALUES('Toy Story 2', 1999, 95, 'copii', 'Walt Disney Pictures', 27);
INSERT INTO Distributie VALUES('Toy Story 2', 1999, 21);

-------------------------------------FILME SF
INSERT INTO Film VALUES('Deadpool', 2016, 108, 'SF', 'Marvel Entertaiment', 15);
INSERT INTO Studio VALUES('Marvel Entertaiment', 'Hollywood', 'SUA', 15);
INSERT INTO Distributie VALUES('Deadpool', 2016, 15);

INSERT INTO Persoana VALUES(24, 'Robert Downey Jr.', 'Hollywood, California, USA', 'M', '04-Apr-1965', '99991000', 'USD');
INSERT INTO Persoana VALUES(25, 'John Whedon', 'Hollywood, California, USA', 'M', '12-Mar-1957', '3210000', 'USD');

INSERT INTO Film VALUES('The Avengers', 2012, 143, 'SF', 'Marvel Entertaiment', 25);
INSERT INTO Distributie VALUES('The Avengers', 2012, 24);

INSERT INTO Film VALUES ('Iron man 2', 2010, 125, 'SF', 'Marvel Entertaiment', 25);
INSERT INTO Distributie VALUES('Iron man 2', 2010, 24);

INSERT INTO Film VALUES('The Avengers 2', 2015, 141, 'SF', 'Marvel Entertaiment', 25);
INSERT INTO Distributie VALUES('The Avengers 2', 2015, 24);

INSERT INTO Persoana VALUES(11, 'Hal B. Wallis', 'Chicago, United States', 'M', '24-May-1955', 1875000, 'USD');
INSERT INTO Persoana VALUES(22, 'Humphrey Bogart', 'Washington DC, United States', 'M', '29-Aug-1969', 8005678, 'USD');


--subpunctul f
ALTER TABLE Persoana
ADD email VARCHAR(30);

--12.02 --> a) coloana gen poate lua doar una din valorile din enunt
ALTER TABLE Film
ADD CONSTRAINT f_gen_unic CHECK(gen LIKE 'SF' or gen LIKE 'copii' or gen LIKE 'drama' or gen LIKE 'comedie');
--test constraint
INSERT INTO Film VALUES('Vinovatul', 2021, 90, 'thriller', 'Netflix', 2);

--12.02 --> b) daca adresa studioului conține ’Hollywood’ atunci tara studioului trebuie să fie ’SUA’.
ALTER TABLE Studio
ADD CONSTRAINT s_tara CHECK(adresa LIKE 'Hollywood' AND (tara LIKE 'SUA') or adresa not like 'Hollywood' );
--test constraint
INSERT INTO Studio VALUES('Netflix', 'Hollywood', 'United States', 1);

--12.03 --> a) Să se găsească detaliile filmelor de gen ’drama’ produse între 2019 și 2022,ordonate descrescător după an și crescător după titlu.
SELECT * FROM film
WHERE gen = 'drama' AND an>2019 AND an<2022
ORDER BY titlu ASC, an DESC;

--> b) Să se găsească numele persoanelor de sex masculin cu câștig net sub 500000 USD, ordonate crescător.
SELECT * FROM Persoana
WHERE sex='M' AND castig_net<500000 AND moneda='USD'
ORDER BY nume

--12.04 Să se exprime în SQL următoarele interogări folosind operatorul JOIN:
-->a) Să se afișeze detaliile numele studioului, numele președintelui studioului și numele producătorului ce au produs filmul ‘CODA’.
SELECT Studio.nume as "Studio", Persoana1.nume as "Presedinte Studio", Persoana2.nume as "Producator", Film.titlu
FROM Film
JOIN Persoana Persoana2 ON (Film.id_producator = Persoana2.id_persoana) 
JOIN Studio ON (Film.studio = Studio.nume) JOIN Persoana Persoana1 ON (Studio.id_presedinte=Persoana1.id_persoana) WHERE Film.titlu = 'CODA'; 

-->b) Care sunt perechile (id_actor, id_actor2) de actori de sex diferit ce au jucat în același film? O pereche este unică în rezultat.
SELECT Distributie1.id_actor as "Actor 1", Distributie2.id_actor  as "Actor 2", Distributie1.titlu_film
FROM Persoana Persoana1
JOIN Distributie Distributie1 ON (Distributie1.id_actor = Persoana1.id_persoana) 
JOIN Distributie Distributie2 ON (Distributie2.titlu_film = Distributie1.titlu_film) 
JOIN Persoana Persoana2 ON (Distributie2.id_actor = Persoana2.id_persoana) 
WHERE (Persoana1.sex = 'F' AND Persoana2.sex = 'M');

--12.05 Să se exprime în SQL fără funcții de agregare următoarele interogări
--folosind cel puţin o interogare imbricată şi operatori de genul EXISTS, IN, ALL, ANY:
-->a) Să se găsească numele producătorilor care au jucat în cel puțin un film pe care l-au produs.
--SELECT Persoana.nume as "Producator", Film.titlu
--FROM Distributie
--JOIN Persoana ON (Distributie.id_actor = Persoana.id_persoana) 
--JOIN Film ON (Persoana.id_persoana = Film.id_producator AND Film.titlu = Distributie.titlu_film) 

SELECT Persoana.nume as "Producator", Film.titlu AS "Titlu"
FROM Film
JOIN Persoana ON (Film.id_producator = Persoana.id_persoana) 
WHERE Persoana.id_persoana = ANY
(SELECT Distributie.id_actor
  FROM Distributie
  WHERE Distributie.titlu_film=Film.titlu);

-->b) Să se găsească titlul, anul, genul și durata filmelor cu durata cea mai mică.
SELECT titlu, gen, an, durata
FROM Film
WHERE Film.durata <= ALL(SELECT Film.durata FROM Film);

--12.06 Să se exprime în SQL următoarele interogări folosind funcţii de agregare:
--> a) Să se găsească pentru fiecare actor în câte filme de gen ‘SF’ a jucat.
SELECT COUNT(Film.titlu) AS "Numar filme SF", p1.nume AS "Actor"
FROM Distributie
JOIN Persoana p1 ON(p1.id_persoana = Distributie.id_actor)
JOIN Film ON(Distributie.titlu_film = Film.titlu)
WHERE Film.gen = 'SF' 
GROUP BY p1.id_persoana, p1.nume;

--> b) Să se găsească pentru fiecare studio, câștigul net minim, câștigul net mediu și
--câștigul net maxim al producătorilor filmelor studioului.
SELECT Film.studio AS "Studio",
MIN(Persoana.castig_net) AS "Castig net minim", 
AVG(Persoana.castig_net) AS "Castig net mediu",
MAX(Persoana.castig_net) AS "Castig net maxim"
FROM Film
JOIN Persoana ON(Persoana.id_persoana = Film.id_producator)
GROUP BY Film.studio;

--12.07 Să se scrie instrucţiunile pentru actualizarea BD:
-->a) Să se adauge filmul ‘The Maltese Falcon’ (Șoimul maltez) din 1941, 100 minute, gen
--‘drama‘, id_producator 11 (‘Hal B. Wallis‘), studio ‘Warner Bros.‘ și unul din actorii
--distribuiți, id_actor 22 (‘Humphrey Bogart’). (se presupune că producătorul, actorul și
--studioul există deja în baza de date)
INSERT INTO Film VALUES('The Maltese Falcon', 1941, 100, 'drama', 'Warner Bros.', 11);
INSERT INTO Distributie VALUES('The Maltese Falcon', 1941, 22);

-->b) Să se șteargă studiourile pentru care nu există filme.
--inserare studio fara niciun film pentru a putea verifica
INSERT INTO Studio VALUES('Marvel', 'Los Angeles', 'SUA', 15);
--dupa care il stergem
DELETE
FROM Studio 
WHERE NOT EXISTS 
( SELECT Film.studio
  FROM Film
  WHERE Film.studio=Studio.nume);

-->c) Să se modifice câștigul net al persoanelor care au moneda USD pentru a reflecta faptul
--că nu mai este exprimat în USD ci în EUR (la rata de schimb din data rezolvării colocviului parțial de laborator).
UPDATE Persoana
SET castig_net = .95*castig_net, moneda = 'EUR'
WHERE moneda = 'USD';

--12.08    Să se definească triggere pentru:
-->a) A asigura la adăugarea în Distribuție a unui actor, dacă este și producător al
--aceluiași film atunci câștigul net al persoanei crește cu 3%, altfel crește cu 1,5%.  
CREATE OR REPLACE TRIGGER change_salary
AFTER INSERT ON distributie 
FOR EACH ROW 
DECLARE 
v_id Film.id_producator%TYPE;
BEGIN 
     SELECT id_producator INTO v_id FROM film WHERE titlu=:NEW.titlu_film;

    IF (:NEW.id_actor = v_id) THEN
        UPDATE persoana 
        SET persoana.castig_net =  persoana.castig_net + persoana.castig_net * 0.03
        WHERE persoana.id_persoana = :NEW.id_actor;
    ELSE
        UPDATE persoana 
        SET persoana.castig_net = persoana.castig_net + persoana.castig_net * 0.015
        WHERE persoana.id_persoana = :NEW.id_actor;
    END IF;
END;
/
INSERT INTO Distributie VALUES('The Maltese Falcon', 1941,1);
-->b) A împiedica modificarea în jos a câștigului net al unei persoane dacă persoana 
--este președinte de studio.
CREATE OR REPLACE TRIGGER Tr_Difuzare
BEFORE UPDATE OF castig_net ON Persoana
FOR EACH ROW
DECLARE
  var_pers Persoana.id_persoana%type;
BEGIN
var_pers=:new.id_persoana
IF ((:new.castig_net <:old.castig_net) AND EXISTS(SELECT * FROM Studio WHERE Studio.id_presedinte=var_pers))
THEN
raise_application_error (-20501,'Nu se poate efectua actualizarea!');
END IF;

END;
/

-->c) Presupunând vederea:
CREATE VIEW FilmecopiiDisney AS
SELECT titlu, an, gen, durata, id_persoana, nume as producator, adresa, sex,
data_nasterii, castig_net, moneda
FROM Filme, Persoana
WHERE id_persoana = id_producator
studio = 'Disney' AND
gen = 'copii';
--Să se definească un trigger instead-of pentru a permite adăugare prin această
--vedere. (un producător poate produce mai multe filme)
CREATE OR REPLACE TRIGGER Tr_FilmecopiiDisney
INSTEAD OF INSERT ON FilmecopiiDisney
DECLARE
new_id_producator number;

BEGIN
SELECT MAX(Film.id_producator) into new_id_producator from Film;
new_id_producator := new_id_producator +1 ;

insert into Film(titlu, an, durata, gen, studio, id_producator)
values (:new.titlu, :new.an, :new.durata, 'copii', 'Disney', new_id_producator);
insert into Persoana(id_persoana, nume, adresa, sex, data_nasterii, castig_net, moneda) 
values(:new.id_persoana, :new.nume, :new.adresa, :new.sex, :new.data_nasterii, :new.castig_net, :new.moneda);
END;




