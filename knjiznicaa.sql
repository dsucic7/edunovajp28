drop database if exists knjiznicaa;
create database knjiznicaa;

use knjiznicaa;

create table knjige (
    sifra int not null primary key auto_increment,
    naslov varchar (100) not null,
    pisac varchar (50) not null,
    vlasnik int,
    clan int,
    datumpos datetime,
    datumvrac datetime
);

create table vlasnik(
    sifra int not null primary key auto_increment,
    knjiga int not null
);

create table clan (
    sifra int not null primary key auto_increment,
    clbroj int not null

);
create table osobe (
    sifra int not null primary key auto_increment,
    ime varchar (50) not null,
    prezime varchar (50) not null,
    adresa varchar (50) ,
    email varchar (100)

);

alter table knjige add foreign key (clan) references clan (sifra);
alter table knjige add foreign key (vlasnik) references vlasnik (sifra);

