drop database if exists regija;
create database regija;

use regija;

create table zupanija(
    sifra int not null primary key auto_increment,
    naziv varchar (50) not null,
    zupan int
);

create table opcina (
    sifra int not null primary key auto_increment,
    zupanija int,
    naziv varchar (50) not null
);

create table mjesto (
    sifra int not null primary key auto_increment,
    opcina int,
    naziv varchar (50)
);

create table zupan (
sifra int not null primary key auto_increment,
ime varchar (50) not null,
prezime varchar (50) not null
);

alter table zupanija add foreign key (zupan) references  zupan (sifra);
alter table opcina add foreign key (zupanija) references zupanija (sifra);
alter table mjesto add foreign key (opcina) references opcina (sifra);

