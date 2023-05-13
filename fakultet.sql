drop database if exists fakultet;
create database fakultet;

-- # 
use fakultet;

create table student(
    id int not null primary key auto_increment,
    firstname varchar(50) not null,
    lastname varchar (50) not null,
    jmbag varchar (20)

);





create table student_course (
    id int not null primary key auto_increment,
    student int,
    course int,
    dateofenroll datetime,
    academicyear int

);

create table course(
    id int not null primary key auto_increment,
    name varchar (50) not null,
    ects int,
    description varchar (100)

);

create table academic_year (
    id int not null primary key auto_increment,
    name varchar(50),
    startdate datetime,
    enddate datetime

);

alter table student_course add foreign key (student) references student (id);
alter table student_course add foreign key (course) references course(id);
alter table student_course add foreign key (academicyear) references academic_year(id);



