drop database if exists hijerarhija1;
create database hijerarhija1;

use hijerarhija1;

create table zaposlenik (
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    placa decimal(18,2),
    nadredeni int --not null ne smije bit poznat jer ima vise razina nadredenih 
);

alter table zaposlenik add foreign key (nadredeni) references zaposlenik (sifra);