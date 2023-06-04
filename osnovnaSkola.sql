/*Osnovna škola
U osnovnoj školi postoje dječje radionice. Na jednoj radionici sudjeluje više djece.
Jedno dijete može sudjelovati na više radionica. Radionicu vodi jedna učiteljica.*/

--C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\dsuci\OneDrive\Documents\edunovajp28\osnovnaSkola.sql

drop database if exists osnovnaSkola;

create database osnovnaSkola;

use osnovnaSkola;

create table djRadionica(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    maxucenika int,
    uciteljica int
);

create table dijete(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar (20) not null
    
);

create table uciteljica (
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar (20) not null
    
);

create table sudjelovanje(
    sifra int not null primary key auto_increment,
    djRadionica int,
    dijete int
);

alter table djRadionica add foreign key (uciteljica) references uciteljica(sifra);
alter table sudjelovanje add foreign key (djRadionica) references djRadionica(sifra);
alter table sudjelovanje add foreign key (dijete) references dijete (sifra);

select * from uciteljica;

insert into uciteljica(ime,prezime)values
	('Marta','Sucic'),
	('Dijana','Budisavljevic'),
	('Nevena','Zagorac');

select * from dijete;

insert into dijete(ime,prezime)values
	('Maria','Susac'),
	('Dinko','Maras'),
	('Biserka','Sucic');

select * from djradionica ;

insert into djRadionica (naziv,maxucenika,uciteljica)values
	('Origami radionica',15,3),
	('Ekoloska radionica',10,1),
	('Djecje kazaliste',8,2);

select * from sudjelovanje;

insert into sudjelovanje (djRadionica,dijete)values
	(1,3),(2,1),(3,2);
