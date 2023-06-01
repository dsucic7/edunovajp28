/*Muzej
U muzeju postoji više izložaba. Jedna izložba ima više djela. Svaki kustos je zadužen
za jednu izložbu. Svaka izložba ima jednog sponzora. */

-- C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\dsuci\OneDrive\Documents\edunovajp28\muzej.sql

drop database if exists muzej;

create database muzej;

use muzej;

create table muzej(
    sifra int not null primary key auto_increment,
    naziv varchar(100) ,
    adresa varchar (100)
);

create table izlozba (
    sifra int not null primary key auto_increment,    
    nazivIzlozbe varchar(50) not null,
    cijena decimal,
    muzej int
     
);

create table djelo(
    sifra int not null primary key auto_increment,
    naziv varchar (50) not null,
    izlozba int
);

create table kustos (
    sifra int not null primary key auto_increment,
    ime varchar (20) not null,
    prezime varchar (30) not null,
    izlozba int

);

create table sponzor( 
    sifra int not null primary key auto_increment,
    izlozba int,
    naziv varchar (50)not null,
    pocetakUgovora date,
    krajUgovora date
);

alter table izlozba add foreign key (muzej) references muzej(sifra);
alter table djelo add foreign key (izlozba) references izlozba(sifra);
alter table kustos add foreign key (izlozba) references izlozba(sifra);
alter table sponzor add foreign key (izlozba) references izlozba(sifra);

select * from muzej;
insert into muzej (naziv,adresa)values
	('Muzej Suvremene Umjetnosti','Avenija Dubrovnik 17,Zagreb'),
	('Muzej iluzija','Ilica 79Zagreb'),
	('Muzej mimara','Rooseveltov trg 5,Zagreb');

select * from izlozba;
insert into izlozba(nazivIzlozbe,cijena,muzej)values
	('Lica kulture - izložba portreta',35,1),
	('Eduaktivni kutak',20,3),
	('Staklo staroga vijeka',27,2);

select * from djelo;
insert into djelo (naziv,izlozba)values
	('Mona Lisa',1),
	('Čist otok je sretan',2),
	('Starovjekovno staklarstvo',3);

select * from kustos;
insert into kustos(ime,prezime,izlozba)values
	('Ivan','Petrekovic',2),
	('Marijan','Zuvela',3),
	('Ivano','Balivuk',1);

select* from sponzor;
insert into sponzor(izlozba,naziv,pocetakUgovora,krajUgovora)values
	(1,'otpbanka','2023-05-01','2023-06-01'),
	(3,'SUPERNOVA','2023-04-15','2023-04-30'),
	(2,'Ministarstvo kulture','2023-09-10','2023-09-20');

update izlozba set nazivIzlozbe='Pametni kutak'
where sifra =2;

delete from djelo where naziv='Mona Lisa';