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

select * from Student;
select * from Student where status = 1;
select * from Subject where credit <10;
select * from Student s join Class c on s.id_class = c.id where c.name = 'A1';
select * from Student stu join Mark m on stu.id = m.id_student join Subject sub on m.id_subject = sub.id where sub.name = 'CF';

select * from Student where name like 'h%';
# select * from Class where startdate between '2018-12-01 00:00:00' and '2018-12-31 23:59:59';
select * from Class where month(startdate)=12;
select * from Subject where credit between 3 and 5;

update Student
set name = 'Duong Dep Trai' where id = 1;

select stu.name, sub.name, m.mark from Student stu join Mark m on stu.id = m.id_student join Subject sub on m.id_subject = sub.id ORDER BY m.mark DESC ;