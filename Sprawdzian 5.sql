--Schemat złączenia 2 tabel w SQL:
--SELECT kolumna1, kolumna2, kolumna3,…….
--FROM Tabela1 JOIN Tabela2
--ON Kolumna_z_1_Tab = Kolumna_z_2_Tab
--WHERE ………
--ORDER BY ………..
-----------------------------------------------------------
--- Zad. 1 -Wyświetl nazwy krajów oraz kod tych krajów, gdzie językiem urzędowym jest jezyk niemiecki

	select *from country;
	select * from language;

	select country.name, language.name from country join language on Country.code=language.country
	where language.name = 'german';


-----------------------------------------------------------
----Zad. 2 -Wyświetl jakie jezyki uzywane są w Belgii i Holandii (Netherlands)
--- posortuj rosnaco wg nazwy państwa
	select * from country
	select * from language;

	select country.name, language.name from country join language on Country.code=language.country
	where country.name in ('Belgium','Netherlands') order by country.name;

-----------------------------------------------------------
 ----Zad. 3 -Wyświetl trzy tabele - państwo, język,  wyznanie oraz procent wyznawców w danym kraju

	select * from religion; 
	select * from country; 
	select * from language; 

	select country.name as państw, religion.name as wyznanie, religion.Percentage as procentowo
	from country join religion on country.code=religion.country where Percentage>50 order by religion.name desc;


-----------------------------------------------------------
--- Zad. 4- Wyświetl nazwy wszystkich krajów europejskich
--wraz z ich stolicami

	select * from country;
	select * from encompasses;
	select country.name,  country.Capital from country join encompasses on country.code=encompasses.country
	where encompasses.Continent in ('europe');

-----------------------------------------------------------

----Zad. 5 -Wyświetl nazwy wszystkich krajów zaczynających się na literę A , stolic tych państw
--- oraz nazwy kontynentów na których te państwa znajdują się.
	select * from country;
	select * from encompasses;
	select country.name, country.Capital, encompasses.Continent from country join encompasses on country.code=encompasses.Country where country.name like 'A%' order by encompasses.Continent;


-----------------------------------------------------------
----Zad. 6 -Wyświetl miasta ich populację, kraj oraz kod państwa tylko tych państw w których państwo ma ludność
----powyżej 800 milionów mieszkańców 

	select * from city;
	select * from country;
	select city.name as city, country.name as country, city.Population, country.Code from city join country on country.code=city.Country where country.Population > 800000000;


-----------------HEVING------------------------------------
-----------------------------------------------------------
---Zad. 7-	policz ile jest wyznań  zaczynających się na literę c do k pogrupuj je wg nazw oraz
--       pokaż tylko te które mają minimum 40% wyznawców w danym kraju. – zastosuj wskaźnik max (tabela religion)

	select * from religion;
	select count(*) as liczba from religion;
	select count(*) as liczba from religion where name like '[c-k]%';
	select name, count(*) as liczba from ethnic_group where name like  '[c-k]%' group by name;
	select name, count(*) as liczba from ethnic_group where name like  '[c-k]%' group by name having max(Percentage)>40;


-------------------------------------------
---Zad. 8- 	policz ile jest miast z zakresu od a-k , pogrupuj je wg kodu państwa oraz pokaż tylko te
	-- państwa których liczba miast w danym państwie jest wieksza niz 50 .(tabela city)

	select * from city;
	select count(name) from city;
	select count(name) from city where name like '[a-k]%';
	select Country, count(name) from city where name like '[a-k]%' group by Country;
	select Country, count(name) from city where name like '[a-k]%' group by Country having count(name) > 50;

-----------------------------------------------
--- Zad. 9 - policz ile jest miast zaczynających się na literę a,d oraz t pogrupuj je wg kodu państwa oraz pokaż tylko te miasta
--   których suma populacji jest większa od 2 milionów w danym państwie.(tabela city)

	select count(name) from city;
	select country, count(name) from city where name like '[a, d, t]%' group by country;
	select country, count(name) from city where name like '[a, d, t]%' group by country having sum(population) > 2000000;


------------------------------------------------
---- Zad. 10 - policz ile jest jezior w panstwach zaczynajacych sie od kody b-k, pogrupuj je wg prowincji 
--oraz pokaż tylko te w których jest powyzej 3 w prowincji.  (tabela  geo_lake)

	select * from geo_lake;
	select count (lake) from geo_lake;
	select count (lake) from geo_lake where country like '[b-k]%';
	select Province, count (lake) from geo_lake where country like '[b-k]%' group by province;
	select Province, count (lake) from geo_lake where country like '[b-k]%' group by province having count(province) > 3;
	
------------------------------------------------
---Zad. 11- policz ile jest ustrojów politycznych z zakresu od a-z , pogrupuj je wg ustroju oraz pokaż tylko te
	-- których liczba  jest wieksza niz 2 .(tabela politics)	

	select count(Government) from politics
	select count(Government) from politics where country like'[a-z]%'
	select Government, count(Government) from politics where Government like'[a-z]%' group by Government
	select Government, count(Government) from politics where Government like'[a-z]%' group by Government having count(Government) > 2;

------------------------------------------------

--- Zad. 12- policz ile jest wyznań  zaczynających się na literę (a, b, c i m) pogrupuj je wg nazw oraz
--       pokaż tylko te których nazw jest powyżej trzech  (tabela religion)

	select count(name) from religion where name like '[a,b,c,m]%';
	select count(name) from religion where name like '[a,b,c,m]%' group by name;
	select name, count(name) from religion where name like '[a,b,c,m]%' group by name;
	select name, count(name) from religion where name like '[a,b,c,m]%' group by name having count(name)>3;


------------------------


