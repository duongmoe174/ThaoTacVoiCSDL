create schema ThucHanhAddData;
use ThucHanhAddData;

create table Class (
    id int auto_increment not null  primary key,
    name nvarchar(20) ,
    startdate datetime ,
    status bit
);
create table Student (
    id int auto_increment not null primary key ,
    name nvarchar(20),
    address nvarchar(50),
    phone varchar(20) unique ,
    status bit,
    id_class int ,
    foreign key (id_class) references Class(id)
);
create table Subject (
    id int auto_increment not null  primary key ,
    name nvarchar(20),
    credit int,
    status bit
);
create table Mark(
    id int auto_increment not null primary key ,
    id_subject int,
    id_student int,
    mark int,
    examtime int,
    foreign key (id_student) references Student(id),
    foreign key (id_subject) references Subject(id)
);

insert into Class (name, startdate, status) values ('A1', '2018-12-20', 1);
insert into Class (name, startdate, status) values ('A2', '2018-12-22', 1);
insert into Class (name, startdate, status) values ('B3', current_date , 0);

insert into Student(name, address, phone, status, id_class) VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1 );
insert into Student(name, address, phone, status, id_class) VALUES ('Hoa', 'Hai Phong', '', 1, 1 );
insert into Student(name, address, phone, status, id_class) VALUES ('Manh', 'HCM', '0123123123', 0, 2 );

insert into Subject( name, credit, status) VALUES ('CF', 5, 1);
insert into Subject( name, credit, status) VALUES ('C ', 6, 1);
insert into Subject( name, credit, status) VALUES ('HDJ', 5, 1);
insert into Subject( name, credit, status) VALUES ('RDBMS', 10, 1);

insert into Mark(id_subject, id_student, mark, examtime) values (1, 1, 8, 1);
insert into Mark(id_subject, id_student, mark, examtime) values (1, 2, 10, 2);
insert into Mark(id_subject, id_student, mark, examtime) values (2, 1, 12, 1);