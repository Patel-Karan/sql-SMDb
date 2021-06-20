use school;
create table if not exists parent (
parent_id int auto_increment primary key,
email varchar(45),
password varchar(45),
fname char(45) not null,
mname char(45) not null,
phone int,
mobile int,
status boolean,
last_login_date date,
last_login_ip varchar(45)
);

create table if not exists student (
student_id int auto_increment primary key,
email varchar(45),
password varchar(45),
fname char(45) not null,
lname char(45),
dob date not null,
phone int,
mobile int,
parent_id int,
date_of_join date,
status boolean,
last_login_date date,
last_login_ip varchar(45),
foreign key(parent_id) references parent(parent_id)
);

create table if not exists teacher (
teacher_id int auto_increment primary key,
email varchar(45),
password varchar(45),
fname char(45) not null,
lname char(45),
dob DATE,
phone int,
mobile int,
status boolean,
last_login_date date,
last_login_ip varchar(45)
);

create table if not exists exam (
exam_id int primary key,
exam_type varchar(45) not null,
name varchar(45),
exam_date date not null
);

create table if not exists attendance (
date DATE,
student_id int,
status boolean,
remark text,
foreign key(student_id) references student(student_id)
);

create table if not exists grade (
grade_id int primary key,
name varchar(45)
);

create table if not exists course (
course_id int auto_increment primary key,
name varchar(45),
description varchar(45),
grade_id int,
foreign key(grade_id) references grade(grade_id)
);

create table if not exists exam_result (
exam_id int,
student_id int,
course_id int,
marks varchar(45),
foreign key(student_id) references student(student_id),
foreign key(exam_id) references exam(exam_id),
foreign key(course_id) references course(course_id)
);

create table if not exists classroom (
classroom_id int primary key,
year YEAR,
grade_id int,
section char(2),
status boolean,
remarks varchar(45),
teacher_id int,
foreign key(grade_id) references grade(grade_id),
foreign key(teacher_id) references teacher(teacher_id)
);

create table if not exists classroom_student (
classroom_id int,
student_id int,
foreign key(classroom_id) references classroom(classroom_id),
foreign key(student_id) references student(student_id)
);






