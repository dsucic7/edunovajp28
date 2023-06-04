/*Fakultet
Studenti polažu kolegije kroz rokove. Student može rok prijaviti više puta a na jedan
rok može izaći više studenata.*/

--C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\dsuci\OneDrive\Documents\edunovajp28\fakultet2.sql

drop database if exists  fakultet2;

create database fakultet2;

use fakultet2;

create table student(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar (20) not null,
    idBroj char (10)

);

create table kolegij(
    sifra int not null primary key auto_increment,
    naziv varchar (50)
    
);

create table rok(
    sifra int not null primary key auto_increment,
    datum datetime not null,
    kolegij int not null

);

create table polaganje(    
    sifra int not null primary key auto_increment,
    rok int,
    student int
);

alter table rok add foreign key (kolegij) references kolegij(sifra);
alter table polaganje add foreign key (rok) references rok (sifra);
alter table polaganje add foreign key (student) references student (sifra);

select * from student;

insert into student(ime,prezime,idBroj)values
	('Petar','Đerek',null),
	('Marija','Krizanac',null),
	('Ivana','Misic',null);

select * from kolegij;

insert into kolegij(naziv)values
	('Informacijske tehnologije'),
	('Operacijski sustavi'),
	('Baze podataka');
	
select * from rok;

insert into rok(datum,kolegij)values
	('2023-01-25 09:00:00', 1),
	('2023-05-10 08:30:00',3),
	('2023-06-30 10:00:00',2);

select * from polaganje;

insert into polaganje(rok,student)values
	(1,1),(1,2),(3,3);
