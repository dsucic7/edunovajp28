/*Frizerski salon
U frizerskom salonu radi više djelatnica. Jedna djelatnica na dan radi s više korisnika.
Korisnik tijekom jednog posjeta koristi jednu usluga.*/

-- C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\dsuci\OneDrive\Documents\edunovajp28\frizerskiSalon.sql

drop database if exists frizerskiSalon;

create database frizerskiSalon;

use frizerskiSalon;

create table korisnik(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    kontakt varchar(50)
);

create table djelatnica (
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    kontakt varchar(50)
);

create table usluga(
    sifra int not null primary key auto_increment,
    nazivUsluge varchar(100),
    cijena decimal(5,2)
);

create table dolazak(
    sifra int not null primary key auto_increment,
    usluga int,
    korisnik int,
    djelatnica int,
    vrijeme datetime
    );

    alter table dolazak add foreign key(usluga) references usluga(sifra);
    alter table dolazak add foreign key (korisnik) references korisnik(sifra);
    alter table dolazak add foreign key (djelatnica) references djelatnica(sifra);

    select * from djelatnica;

insert into djelatnica (ime,prezime,kontakt)values
	('Marijana','Petric','097234071'),
	('Ivana','Filipovic','01752378'),
	('Marija','Anokic','095937810');

    select * from korisnik;

insert into korisnik(ime,prezime,kontakt)values
 	('Mario','Jelic','032222790'),
 	('Ivan','Petrak','0986537482'),
 	('Damir','Jozic','0917325673');

select * from usluga;

insert into usluga (nazivUsluge,cijena)values
	('Kratko sisanje sa masinicom','10'),
	('Uredivanje brade','17'),
	('Bojanje kose','20');

select * from dolazak;

insert into dolazak(usluga,korisnik,djelatnica,vrijeme)values
	(1,2,3,'2023-05-17 10-00'),
	(3,2,2,'2023-10-23 09-00'),
	(2,2,2,'2023-2-27 13-00');

--Update

update dolazak set korisnik=1 where sifra=2;
update korisnik set ime='Marijan' where sifra=3;
update djelatnica set prezime='Krvavac' where sifra=3;

