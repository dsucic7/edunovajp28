/*Samostan
U samostanu se nalaze svećenici. Svaki svećenik je zadužen za više poslova. Jedan
posao u isto vrijeme može obavljati više svećenika. Svaki svećenik ima samo jednog
nadređenog svećenika.*/

-- C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\dsuci\OneDrive\Documents\edunovajp28\samostan.sql

drop database if exists samostan;

create database samostan;

use samostan;

create table svecenik(
    sifra int not null primary key auto_increment,
    ime varchar (20) not null,
    prezime varchar (20) not null,
    nadredeniSvecenik int
);

create table posao(
    sifra int not null primary key auto_increment,
    naziv varchar (20) not null

);

create table nadredeniSvecenik (
   sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar (20) not null

);

create table svecenikPosao(
    svecenik int,
    posao int

);

alter table svecenik add foreign key (nadredeniSvecenik) references nadredeniSvecenik (sifra);
alter table svecenikPosao add foreign key (svecenik) references svecenik(sifra);
alter table svecenikPosao add foreign key (posao) references posao(sifra);

select * from nadredeniSvecenik;

insert into nadredeniSvecenik(ime,prezime)values
	('Dejan','Mlinar'),
	('Filip','Apostolovski'),
	('Damir','Sucic');

select * from posao;

insert into posao(naziv) values
	('Posao 1'),
	('Posao 2'),
	('Posao 3');


select * from svecenik;

insert into svecenik(ime,prezime,nadredeniSvecenik) values
	('Mario','Sucic',2),
	('Zvonimira','Brnjac',1),
	('Krunoslav','Krvavac',3);


select * from svecenikPosao;

insert into svecenikPosao(svecenik,posao)values
	(1,2),(3,2),(1,1);