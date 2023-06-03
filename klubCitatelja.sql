/*Klub čitatelja
Klub čitatelja se sastoji od članova koji čitaju knjige. Jedan čitatelj može čitati više
knjiga, dok jednu knjigu kroz duže vremensko razdoblje može čitati više čitatelja.
Svaka knjiga ima jednog i samo jednog vlasnika dok jedan vlasnik može imati više
knjiga. Vlasnik je ujedno i čitatelj.*/

-- C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\dsuci\OneDrive\Documents\edunovajp28\klubCitatelja.sql

 drop database if exists klubCitatelja;
  create database klubCitatelja;
  use klubCitatelja;

  create table knjiga(
    sifra int not null primary key auto_increment,
    naslov varchar (50) not null,
    autor varchar (30),
    vlasnik int
  );

  create table citatelj(
    sifra int not null primary key auto_increment,
     ime varchar (20),
    prezime varchar (20)


  );

  create table vlasnik(
    sifra int not null primary key auto_increment,
     ime varchar (20),
    prezime varchar (20)


  );

  create table clan(
    knjiga int,
    citatelj int

  );

  alter table knjiga add foreign key (vlasnik) references vlasnik (sifra);
  alter table clan add foreign key (knjiga) references knjiga(sifra);
  alter table clan add foreign key (citatelj) references citatelj (sifra);

  select * from vlasnik;

insert into vlasnik(ime,prezime) values
	('Mario','Juric'),
	('Nikola','Mezer');

select * from knjiga;

insert into knjiga(naslov,autor,vlasnik) values
	('12 pravila za život','Jordan Peterson',1),
	('Okruzen narcisima','Thomas Erikson',2),
	('Ima li života prije smrti','Robert Torre',1);

select * from citatelj;

insert into citatelj(ime,prezime) values
	('Mario','Jelic'),
 	('Ivan','Petrak'),
 	('Damir','Jozic');	

select * from clan;

insert into clan(knjiga,citatelj) values
	(1,2),(3,3),(2,3);

