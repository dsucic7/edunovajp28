/*Taksi služba
Taksi tvrtka ima više vozila. Jedno vozilo vozi jedan vozač. U jednoj vožnji vozač
može prevesti više putnika. Jedan putnik se naravno može tijekom vremena imati više
vožnji.*/

-- C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\dsuci\OneDrive\Documents\edunovajp28\taxiSluzba.sql

drop database if exists taxiSluzba;

create database taxiSluzba;

use taxiSluzba;

create table vozilo (
    sifra int not null primary key auto_increment,
    nazivVozila varchar(20) not null,
    registracija varchar(10)
       
);

create table vozac(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    vozilo int

);

create table putnik(
    sifra int not null primary key auto_increment,
    ime varchar (20),
    prezime varchar (20) 

);

create table putnikVozac(
    putnik int,
    vozac int

);

alter table vozac add foreign key (vozilo) references vozilo(sifra);
alter table putnikVozac add foreign key (putnik) references putnik(sifra);
alter table putnikVozac add foreign key (vozac) references vozac(sifra);

select * from vozilo;

insert into vozilo(nazivVozila, registracija)values
	('Toyota','VK232OS');

select * from putnik;

insert into putnik(ime,prezime)values 
	('Pero','Peric');

select * from vozac;

insert into vozac(ime,prezime,vozilo)values 
	('Mario','Maric',1);

select * from putnikVozac;

insert into putnikVozac(putnik,vozac)values 
	(1,1);