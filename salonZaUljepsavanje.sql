/*Salon za uljepšavanje
U salonu za uljepšavanje radi više djelatnica. Jedna djelatnica na dan radi s više
korisnika. Korisnik tijekom jednog posjeta koristi jednu usluga.*/

-- C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\dsuci\OneDrive\Documents\edunovajp28\salonZaUljepsavanje.sql

drop database if exists salonZU;
create database salonZU;

use salonZU;

create table djelatnica(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    email varchar(100)
);

create table korisnik(
    sifra int not null primary key auto_increment,
    ime varchar (20) not null,
    prezime varchar(20) not null,
    email varchar(100)
);

create table usluga(
    sifra int not null primary key auto_increment,
    nazivUsluge varchar(50),
    cijena decimal(5,2),
    potrebnoVrijemeMin varchar(10)
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

insert into djelatnica(ime,prezime,email)values
	('Katarina','Saric','ksaric@gmail.com'),
	('Andela','Pavlovic','apavlovic@gmail.com'),
	('Emma','Mlivic','emlivic@gmail.com');

select * from usluga;

insert into usluga(nazivUsluge,cijena,potrebnoVrijemeMin)values
	('Tretmani lica',15,'60'),
	('Masaza',20,'60'),
	('Pedikura',25,'45');

select * from korisnik;

insert into korisnik(ime,prezime,email)values
	('Josip','Gajčević','jgajcevic@gmail.com'),
	('Marko','Bilic','mbilic@gmail.com'),
	('Slaven','Sostar','ssostar@gmail.com');

select * from dolazak;

insert into dolazak(usluga,korisnik,djelatnica,vrijeme)values
	(1,2,1,'08:00'),
	(2,1,2,'09:00'),
	(1,2,1,'13:00');

update 

update djelatnica set ime='Marijana'
where sifra =1;

update korisnik set email='dsucic7@gmail.com'
where sifra=3;

update usluga set cijena='7'
where sifra =3;