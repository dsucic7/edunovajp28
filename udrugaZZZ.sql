/*3. Udruga za zaštitu životinja
U udruzu radi više osoba. Jedna osoba se brine za jednog ili više štićenika udruge.
Štićenici udruge su životinje. Svaki štićenik se nalazi u jednom prostoru.*/

-- c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\dsuci\OneDrive\Documents\edunovajp28\udrugaZZZ.sql

drop database if exists udruga;

create database udruga;

use udruga;

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    oib varchar(11)

);

create table zivotinja(
    sifra int not null primary key auto_increment,
    ime varchar(20)  not null,
    pasmina varchar (20),
    osoba int,
    prostor int
);

create table prostor(
    sifra int not null primary key auto_increment,
    brojProstorije varchar(20)

);

alter table zivotinja add foreign key (osoba) references osoba(sifra);
alter table zivotinja add foreign key (prostor) references prostor(sifra);


select * from osoba;

insert into osoba(ime,prezime,oib)values
	('Damir','Sucic',null),
	('Dejan','Mlinar',null),
	('Filip','Latinovic',null);

select * from prostor;

insert into prostor(brojProstorije)values
	('1. Prostorija'),
	('2. Prostorija'),
	('3. Prostorija');

select * from zivotinja;

insert into zivotinja(ime,pasmina,osoba,prostor)values
	('Bella','Am.stafford',1,2),
	('Dony','Jazavcar',2,1),
	('Arya','Cane Corse',3,3);


update osoba set ime='Petar'
where sifra =1;

update zivotinja set pasmina='terijer'
where sifra =2;

delete from zivotinja where osoba=2;
delete from osoba where ime ='Dejan';

