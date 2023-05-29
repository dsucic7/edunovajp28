
-- C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\dsuci\OneDrive\Documents\edunovajp28\galerija.sql
drop database if exists galerijaSlika;

create database galerijaSlika;

use galerijaSlika;

create table galerija(
    sifra int not null primary key auto_increment,
    naziv varchar (30) not null,
    nadredena int,
    autor int
);

create table slika (
   sifra int not null primary key auto_increment,
   galerija int,
   putanja varchar (100)

);

create table slikaOznaka(
    slika int,
    oznaka int

);

create table oznaka(
    sifra int not null primary key auto_increment,
    naziv varchar (30)

);

create table autor(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar (20) not null


);

alter table galerija add foreign key (nadredena) references galerija (sifra);
alter table galerija add foreign key (autor) references autor(sifra);
alter table slika add foreign key (galerija) references galerija (sifra);
alter table slikaOznaka add foreign key (slika) references slika(sifra);
alter table slikaOznaka add foreign key (oznaka) references oznaka(sifra);

select * from autor;
insert into autor(ime,prezime)values 
	('Mladen','Grdovic'),
	('Miroslav','Skoro'),
	('Oliver','Dragojevic');

select * from galerija;

insert into galerija(naziv,nadredena,autor)values
	('Zabavna glazba',null,1),
	('Slavonski pjevac',null,2),
	('Dalmatinski pjevac',null,3);

select * from slika;
insert into slika(sifra,galerija,putanja)values
	(null,1,null),
	(null,2,null),
	(null,3,null);

select * from oznaka;
insert into oznaka(naziv)values
	('Dalmatinska vecer'),
	('Slavonska vecer'),
	('Porin');

select * from slikaOznaka;
 insert into slikaOznaka(slika,oznaka)values
 	(1,1),
 	(2,2),
 	(3,3);

update autor set ime='Ivana'
where sifra =1;

update galerija set naziv='Slavonska vecer'
where sifra =3;

update autor set prezime='2'
where sifra=3;

delete from slikaOznaka where slika=1;
delete from slikaOznaka where slika=2;