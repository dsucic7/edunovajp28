/*Dječji vrtić
U dječjem vrtiću postoji više odgojnih skupina. Svaka odgojna skupina ima više djece
i vodi ih jedna odgajateljica. Odgajateljica ima jednu stručnu spremu.*/

-- C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\dsuci\OneDrive\Documents\edunovajp28\djecjiVrtic.sql

drop database if exists vrtic;

create database vrtic;

use vrtic;

create table odgojnaSkupina(
    sifra int not null primary key auto_increment,
    naziv varchar (30) not null,
    maxDjece int,
    dijete int

);

create table dijete(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar (20) not null,
    godina int not null,
    kontaktRoditelja varchar (20)


);

create table odgajateljica (
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar (20) not null,
    kontakt varchar(20),
    strucnaSprema int,
    odgojnaSkupina int
);

create table strucnaSprema ( 
    sifra int not null primary key auto_increment,
    naziv varchar (30)    
);


alter table odgojnaSkupina add foreign key (dijete) references dijete(sifra);
alter table odgajateljica add foreign key (strucnaSprema) references strucnaSprema(sifra);
alter table odgajateljica add foreign key (odgojnaSkupina) references odgojnaSkupina(sifra);

select * from strucnaSprema;

insert into strucnaSprema(naziv)values
	('Visoka strucna sprema'),
	('Akademik'),
	('Specijalist');

select * from dijete;
insert into dijete (ime,prezime,godina,kontaktRoditelja)values
	('Mateja','Sucic',3,null),
	('Mateo','Maric',2,null),
	('Jakov','Mlivic',4,null);

select * from odgojnaSkupina;
insert into odgojnaSkupina(naziv,maxDjece,dijete)values
	('jaslice',10,1),
	('vrticka',15,2),
	('mlada vrticka',15,3);

select * from odgajateljica;
insert into odgajateljica(ime,prezime,kontakt,strucnaSprema,odgojnaSkupina)values
	('Marija','Ivezic',null,1,1),
	('Petar','Peric',null,2,1),
	('Milos','Latinovic',null,3,3);

update odgajateljica set ime='Petra'
where sifra=2;

update odgajateljica set ime='Milena'
where sifra=3;

delete from odgojnaSkupina where dijete=2;
delete from odgajateljica where strucnaSprema=1;
delete from strucnaSprema where naziv='Visoka strucna sprema';
