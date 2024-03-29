create database ql_sinhvien;
use ql_sinhvien;

create table class(
class_id int auto_increment primary key not null,
class_name varchar(60) not null,
start_date datetime not null,
status bit
);
create table student(
student_id int auto_increment primary key not null,
student_name varchar(30) not null,
address varchar(50),
phone varchar(20),
status bit,
class_id int,
foreign key (class_id) references class(class_id)
);
create table Subjects(
sub_id int auto_increment primary key not null,
sub_name varchar(30) not null,
credit tinyint not null default 1 check(credit >=1),
status bit default 1
);
create table Mark(
mark_id int auto_increment primary key not null,
sub_id int not null,
student_id int not null,
mark float default 0 check(mark between 0 and 100),
exam_time tinyint default 1,
unique(sub_id,student_id),
foreign key (sub_id) references Subjects(sub_id),
foreign key (student_id) references Student(student_id)
);