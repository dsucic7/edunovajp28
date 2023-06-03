/*Postolar
Postolar popravlja obuću. Jedan korisnik može postolaru donijeti više komada obuće
na popravak dok jedan komad obuće može biti više puta na popravku. Postolar ima
šegrta koji sudjeluje u određenim popravcima obuće.*/

-- C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\dsuci\OneDrive\Documents\edunovajp28\postolar.sql

drop database if exists postolar;

create database postolar;

use postolar;

create table postolar(
    sifra int not null primary key auto_increment,
    ime varchar (20),
    prezime varchar (20),
    segrt int
    );

create table korisnik (
    sifra int not null primary key auto_increment,
    ime varchar (20),
    prezime varchar (20)

);

create table obuca(
    sifra int not null primary key auto_increment,
    vrstaObuce varchar (20),
    korisnik int

);

create table segrt(
    sifra int not null primary key auto_increment,
    ime varchar (20),
    prezime varchar (20)
);

create table popravak(
    sifra int not null primary key auto_increment,
    postolar int,
    obuca int

);

alter table postolar add foreign key (segrt) references segrt (sifra);
alter table obuca add foreign key (korisnik) references korisnik (sifra);
alter table popravak add foreign key (postolar) references postolar(sifra);
alter table popravak add foreign key (obuca) references obuca (sifra);

select * from korisnik

insert into korisnik(ime,prezime)values
	('Mario','Pazanin'),
	('Marijana','Pavlicic');

select * from segrt;

insert into segrt(ime,prezime)values
    ('Damir','Sucic');

select * from obuca;

insert into obuca(vrstaObuce,korisnik)values
	('Štikle',2),
	('Cipele',1);

select * from postolar;

insert into postolar(ime,prezime,segrt)values
	('Dejan','Mlinar',1);

select * from popravak;

insert into popravak(postolar,obuca)values
	(1,1);