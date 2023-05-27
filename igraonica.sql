drop database if exists igraonica;

-- # C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\dsuci\OneDrive\Documents\edunovajp28\igraonica.sql

create database igraonica;

use igraonica;

create table dijete (
    sifra int not null primary key auto_increment,
    ime varchar (30) not null,
    imeRoditelja varchar (30)not null,
    prezime varchar (30) not null,
    telefonroditelja varchar (15) not null
);

create table posjeta (
    sifra int not null primary key auto_increment,  
    datumVrijemeDolaska datetime not null,
    datumVrijemeOdlaska datetime not null,
    napomena varchar (30),
    djelatnik_sifra int
);

create table dijeteposjeta (
    dijete int,
    posjeta int
);
create table usluga (
    sifra int not null primary key auto_increment,
    cijena decimal not null,
    jedinicaMjere varchar (40),
    kolicina decimal,
    naziv varchar(50)

);

create table uslugaposjeta (
    usluga int,
    posjeta int
);

 create table djelatnik (
    sifra int not null primary key auto_increment,
    iban varchar (50),
    ime varchar (30) not null,
    oib varchar (11),
    prezime varchar (30) not null,
    radnoMjesto varchar (30)


);

create table operater (
    sifra int not null primary key auto_increment,
    email varchar (100),
    ime varchar (20) not null,
    lozinka varchar(20),
    oib varchar(11),
    prezime varchar (20) not null

);

alter table dijeteposjeta add foreign key (dijete) references dijete(sifra);
alter table dijeteposjeta add foreign key (posjeta) references posjeta(sifra);
alter table uslugaposjeta add foreign key (posjeta) references posjeta(sifra);
alter table uslugaposjeta add foreign key (usluga) references usluga(sifra);
alter table posjeta add foreign key (djelatnik_sifra) references djelatnik(sifra);

select * from operater;

insert into operater (sifra,email,ime,lozinka,oib,prezime) values
     (null,'ppreradovic@gmail.com','Petar',null,null,'Preradovic'),
     (null,'jjosipovic@gmail.com','Josip',null,null,'Josipovic'),
     (null,'ddeanovic@gmail.com','Dean',null,null,'Deanovic');

select * from dijete;

insert into dijete (ime,imeRoditelja,prezime,telefonroditelja) values 
    ('Petar','Ivan','Ivancic','0953232323'),
    ('Marko','Jakov','Bilic','032333703'),
    ('Mario','Berislav','Kruljac','0915897645');

select * from djelatnik;

insert into djelatnik (iban,ime,oib,prezime,radnoMjesto) values
	(null,'Marko',null,'Maric',null),
	(null,'Marija',null,'Pavlovic',null),
	(null,'Antonija',null,'Mazar',null);

select* from posjeta;

insert into posjeta (datumVrijemeDolaska,datumVrijemeOdlaska,napomena,djelatnik_sifra) values
	('2023-01-13 15:00:00','2023-01-13 17:00:00',null,1),
	('2023-02-09 10-00-00','2023-02-09 11-00-00',null,2),
	('2023-11-11 11-00-00','2023-11-11 13-00-00',null,3);

select * from dijeteposjeta;

insert into dijeteposjeta (dijete,posjeta)values
	(1,3),(2,1),(3,3);

select * from usluga;

insert into usluga (cijena,jedinicaMjere,kolicina,naziv)values
	(20.00,'sat',1.00,'bazen igraonica'),
	(15.00,'sat',1.00,'drustvene igre'),
	(25.00,'sat',1.00,'digitalne igre');

select * from uslugaposjeta;

insert into uslugaposjeta(usluga,posjeta) values
	(1,2),(3,1),(2,3);

   -- update operater

   update operater set oib='06285366890'
where sifra=1;

update operater set ime='Tomislav'
where sifra=2;

update operater set email='mpavlovic@gmail.com',ime='Mario',oib='23459820580',
prezime='Pavlovic'
where sifra=3;

-- update dijete

 update dijete set imeRoditelja='Marijana'
where sifra=2;

update dijete set prezime='Marijancevic'
where sifra=1;

update dijete set telefonroditelja='0983759347'
where sifra=3;

--update djelatnik

update djelatnik set iban='997085366890'
where sifra=1;

update djelatnik set ime='Josipa'
where sifra=2;

update djelatnik set ime='Marijana', oib='12345623457', prezime='Krvavac',radnoMjesto='Madionicar'
where sifra=3;

-- update posjeta

select * from posjeta;

update posjeta set napomena='Dijete je kasnilo'
where sifra=1;

update posjeta set datumVrijemeDolaska='2023-01-14 16-00-00'
where sifra=2;

update posjeta set datumVrijemeOdlaska='2023-11-11 12-00-00'
where sifra = 3;

--update usluga

select * from usluga;

update usluga set cijena='8'
where sifra = 1;

update usluga set jedinicaMjere='pola sata'
where sifra=2;

update usluga set kolicina='2'
where sifra =3;



