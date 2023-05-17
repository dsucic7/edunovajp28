# c:\xampp\mysql\bin\mysql -uroot < C:\Users\Mili\Documents\GitHub\EdunovaJP28\bluefreedom.sql

drop database if exists BlueFreedom;
create database BlueFreedom default charset utf8mb4;
use BlueFreedom;

# CREATING TABLES

create table operater(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(50) not null,
    lozinka char(60) not null,
    uloga varchar(20) not null
);


create table objava(
    sifra int not null primary key auto_increment,
    naslov varchar(50) not null,
    upis varchar(250) not null,
    vrijemeizrade datetime not null,
    ipadresa varchar(20),
    osoba int
);

create table svidamise(
    sifra int not null primary key auto_increment,
    vrijemesvidanja datetime not null,
    objava int,
    osoba int
);

create table komentar(
    sifra int not null primary key auto_increment,
    vrijemekomentiranja datetime not null,
    opis varchar(250),
    objava int,
    osoba int
);

create table svidamise_komentar(
    sifra int not null primary key auto_increment,
    osoba int,
    komentar int
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(25) not null,
    prezime varchar(25) not null,
    datumrodenja datetime,
    email varchar(50) not null,
    lozinka varchar(60) not null,
    brojtel int(15),
    slika varchar(100),
    administrator boolean not null,
    stanje boolean not null,
    aktivan boolean not null,
    uniqueid varchar(255)
);


# ADDING ENTITY RELATIONSHIPS

alter table objava add foreign key (osoba) references osoba(sifra) on delete cascade;

alter table komentar add foreign key (objava) references objava(sifra) on delete cascade;
alter table komentar add foreign key (osoba) references osoba(sifra) on delete cascade;

alter table svidamise_komentar add foreign key (komentar) references komentar(sifra) on delete cascade;

alter table svidamise add foreign key (objava) references objava(sifra) on delete cascade;
alter table svidamise add foreign key (osoba) references osoba(sifra) on delete cascade;

alter table svidamise_komentar add foreign key (osoba) references osoba(sifra) on delete cascade;
