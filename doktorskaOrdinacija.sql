/*
Doktorska ordinacija
Doktor liječi pacijente. Jednog pacijenta može liječiti više puta. U liječenju pacijenta
doktoru pomažu medicinske sestre.
*/

-- C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\dsuci\OneDrive\Documents\edunovajp28\doktorskaOrdinacija.sql

drop database if exists doktorskaOrdinacija;

create database doktorskaOrdinacija;

use doktorskaOrdinacija;

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar (20) not null,
    prezime varchar (20) not null

);

create table doktor(
   sifra int not null primary key auto_increment,
   osoba int not null,   
   oib char(11),
   medicinskaSestra int
);

create table pacijent(
    sifra int not null primary key auto_increment,
    osoba int not null,
    oib char(11)
    
);

create table lijecenje(
    sifra int not null primary key auto_increment,
    naziv varchar(100)not null,
    opis varchar(200)

);

create table medicinskaSestra(
    sifra int not null primary key auto_increment,
    osoba int not null,
    oib char(11)

);

create table pacijentLijecenje(
sifra int not null primary key auto_increment,
lijecenje int,
doktor int,
pacijent int

);

alter table doktor add foreign key (medicinskaSestra) references medicinskaSestra(sifra);
alter table doktor add foreign key (osoba) references osoba(sifra);
alter table pacijent add foreign key (osoba) references osoba(sifra);
alter table medicinskaSestra add foreign key (osoba) references osoba (sifra);
alter table pacijentLijecenje add foreign key (lijecenje) references lijecenje(sifra);
alter table pacijentLijecenje add foreign key (doktor) references doktor (sifra);
alter table pacijentLijecenje add foreign key (pacijent) references pacijent (sifra);

select * from osoba;

insert into osoba(ime,prezime)values
	('Petar','Peric'),
	('Marija','Miric'),
	('Dejan','Mlinar'),
	('Filip','Latinovic'),
	('Damir','Sucic');

select * from medicinskasestra;

insert into medicinskasestra (osoba,oib)values
	(2,null);

select * from doktor;

insert into doktor (osoba,oib,medicinskaSestra)values
	(1,null,1);

select * from pacijent;

insert into pacijent (osoba,oib)values
	(3,null),
	(4,null),
	(5,null);

select * from lijecenje;

insert into lijecenje (naziv,opis)values
	('Upala grla','Grlobolja, otežano gutanje, povećanje limfnih 
       čvorova vrata i povišena tjelesna temperatura.'),
    ('Glavobolja','Migrena je najpoznatiji predstavnik tzv. primarnih glavobolja');

select * from pacijentLijecenje;

insert into pacijentLijecenje(lijecenje,doktor,pacijent)values
	(1,1,1), (2,1,2), (2,1,3);	