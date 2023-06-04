/*Urar Silvija
Urar popravlja satove. Jedan korisnik može uraru donijeti više satova na popravak dok
jedan sat može biti više puta na popravku. Urar ima šegrta koji sudjeluje u određenim
popravcima satova. 
*/

-- C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\dsuci\OneDrive\Documents\edunovajp28\urarSilvija.sql

drop database if exists urarSilvija;

create database urarSilvija;

use urarSilvija;

create table urar(
    sifra int not null primary key auto_increment,
    ime varchar (20),
    prezime varchar (20),
    segrt int
    );

create table korisnik (
    sifra int not null primary key auto_increment,
    ime varchar (20),
    prezime varchar (20),
    kontakt varchar(100) not null
);

create table sat(
    sifra int not null primary key auto_increment,
    marka varchar(50),
	kvar varchar(50) not null,
    korisnik int

);

create table segrt(
    sifra int not null primary key auto_increment,
    ime varchar (20),
    prezime varchar (20)
);

create table popravak(
    sifra int not null primary key auto_increment,
    urar int,
    sat int

);

alter table urar add foreign key (segrt) references segrt(sifra);
alter table sat add foreign key (korisnik) references korisnik(sifra);
alter table popravak add foreign key (urar) references urar(sifra);
alter table popravak add foreign key (sat)references sat(sifra);

select * from korisnik;

insert into korisnik (ime,prezime,kontakt)values
	('Petra','Simic','0986754321'),
	('Ivana','Maric','imaric@gmail.com'),
	('Marijana','Vistica','033456712');

select * from segrt;

insert into segrt(ime,prezime)values
	('Matija','Salac');

select * from urar;

insert into urar(ime,prezime,segrt)values
	('Damir','Sucic',1);

select * from sat;

insert into sat(marka,kvar,korisnik)values
	('Casio','Puklo stakalce',3),
	('Garmin','Zamjena baterije',2),
	('Rolex','Obican servis',1);

select * from popravak;

insert into popravak(urar,sat)values
	(1,2),(1,3),(1,1);

