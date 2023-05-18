drop database if exists edunovajp28;
create database edunovajp28;

-- # c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\dsuci\OneDrive\Documents\edunovajp28\edunovajp28.sql

use edunovajp28;

create table smjer(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,    
cijena decimal(18,2),
upisnina decimal (18,2),
trajanje int not null,
verificiran boolean
);

create table grupa(
sifra int not null primary key auto_increment,
naziv varchar (50) not null,
smjer int not null, 
maxpolaznika int,
predavac int,
datumpocetka datetime
);


create table predavac (
sifra int not null primary key auto_increment,
iban varchar (50),
osoba int not null
);

create table polaznik (
sifra int not null primary key auto_increment,
brojugovora varchar (20),
osoba int not null
);

create table osoba (
sifra int not null primary key auto_increment,
ime varchar (50) not null,
prezime varchar (50) not null,
oib char (11),
email varchar (100)
);

create table clan (
grupa int not null,
polaznik int not null
);

alter table grupa add foreign key (smjer) references smjer (sifra);

alter table grupa add foreign key (predavac) references predavac (sifra);

alter table predavac add foreign key (osoba) references osoba (sifra);

alter table polaznik add foreign key (osoba) references osoba (sifra);

alter table clan add foreign key (polaznik) references polaznik(sifra);

alter table clan add foreign key (grupa) references grupa(sifra);



-- najlosiji nacin unosa

insert into smjer values
(null,'Java programiranje ŠČ',995.42,73,130,true);

-- malo bolji nacin unosa

insert into smjer (naziv,trajanje) values
('Web programiranje',250);
  
-- primjer dobre prakse (best practice)
 
 insert into smjer (sifra,naziv,cijena,upisnina,trajanje,verificiran) values
 (null,'PHP programiranje ', 850,73,130,false);

select * from osoba; 

insert into osoba (sifra,ime,prezime,oib,email) values

(null,'Denis','Simov',null,'dsimov19@gmail.com'),
(null,'Ivan','Islentiev',null,'ivanislentiev@hotmail.com'),
(null,'Antonio','Majić',null,'antonio.majich@gmail.com'),
(null,'Kristi','Belić',null,'kristinovoselic@gmail.com'),
(null,'Josip','Belić',null,'josip.belic989@gmail.com'),
(null,'Ivan','Marošević',null,'ivanmarosevic4@gmail.com'),
(null,'Damir','Sučić',null,'dsucic7@gmail.com'),
(null,'Dino','Dješka',null,'dino.djeska@gmail.com'),
(null,'Goran','Kovačić',null,'kovacic.go@gmail.com'),
(null,'Luka','Lijić',null,'lukalijic8@gmail.com'),
(null,'Antonio','Miloloža',null,'milolozaantonio@yahoo.com'),
(null,'Marijan','Kešinović',null,'kesinovic957@gmail.com'),
(null,'Ivan','Kuna',null,'ivan.kuna@yahoo.com'),
(null,'Maksimilian','Bagarić',null,'maxbagaric@gmail.com'),
(null,'Martin','Tetković',null,'marcatet001@gmail.com'),
(null,'Vjeran','Šergo',null,'vjeran.sergo@gmail.com'),
(null,'Filip','Čatić',null,'fcatic031@gmail.com'),
(null,'Petar','Matić',null,'petarmatic00@gmail.com'),
(null,'Branimir','Fekete',null,'branimir.fekete@gmail.com'),
(null,'Lazar','Volarev',null,'lazarv79@gmail.com'),
(null,'Adriana','Plečaš',null,'adriana.plecas@gmail.com'),
(null,'Goran','Franjić',null,'goran@proces.hr'),
(null,'Marko','Ivanović',null,'markoivanovic19@gmail.com'),
(null,'Emina','Vejsilović',null,'emiomiemi@gmail.com'),
(null,'Ana','Jurić',null,'ana.juric19@gmail.com');
