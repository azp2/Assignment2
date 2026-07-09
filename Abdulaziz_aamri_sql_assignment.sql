-- Task 1: Create Database and Taples
create database if not exists training_center_db;
use training_center_db;

-- create the taples 
create table instructors (
	instructor_id int auto_increment primary key,
    full_name varchar(100) not null,
    email varchar(100) not null unique,
    specialty varchar(100)
    );
create table students (
	student_id int auto_increment primary key,
    full_name varchar(100) not null,
    email varchar(100) not null unique,
    age int,
    city varchar(50) default 'Riyadh',
    created_at timestamp default current_timestamp,
    constraint chk_student_age check (age >= 18)
    );
create table courses(
		course_id int auto_increment primary key,
        course_name varchar(100) not null,
        category varchar(50),
        price decimal(10,2) not null, 
        duration_hours int,
        start_date date,
        instructor_id int,
        foreign key (instructor_id) references instructors(instructor_id),
        constraint chk_course_price check (price >= 0));
create table enrollments(
		enrollment_id int auto_increment primary key,
        student_id int,
        course_id int,
        enrollment_date date,
		status varchar(20) default 'Enrolled',
        grade decimal(5,2),
        foreign key (student_id) references students(student_id),
        foreign key (course_id) references courses(course_id));


-- Task 2: insert the data
insert into instructors (full_name, email, specialty) values
	('abdulaziz aamri', 'aziz515@example.com', 'web development'),
    ('salman smel', 'salma99n@example.com', 'database managment'),
    ('hisham alotaibi', 'hisham44@example.com', 'artificial intelligence'),
    ('bander aamri', 'bander1221@example.com', 'software engineering');

insert into students (full_name, email, age, city) values
('omar al-shahrani', 'omar@example.com', 22, 'riyadh'),
('ali abdullah', 'ali@example.com', 19, 'riyadh'),
('hassan mohammed', 'hassan@example.com', 25, 'dammam'),
('aziz alahmadi', '3z_12@example.com', 28, 'jeddah'),
('mohmmad aldosari', 'moh@example.com', 21, 'riyadh'),
('salem alyami', 'salem@example.com', 24, 'khobar'),
('majed alotaibi', 'majed@example.com', 20, 'abha'),
('bander aljuhani', 'bander@example.com', 23, 'medina'),
('ali alhussain', 'ali22@example.com', 26, 'riyadh'),
('tariq almutairi', 'tariq@example.com', 22, 'qassim');

insert into courses (course_name, category, price, duration_hours, start_date, instructor_id) values
('sql fundamentals', 'database', 500.00, 20, '2026-08-01', 2),
('advance backend engineering', 'web', 800.00, 40, '2026-08-15', 1),
('machine learning basics', 'ai', 1200.00, 50, '2026-09-01', 3),
('full stack with node', 'web', 950.00, 45, '2026-08-20', 1),
('cloud computing azure', 'cloud', 1500.00, 60, '2026-10-01', 4),
('advance deep learning', 'ai', 1100.00, 30, '2026-11-01', 3); 

insert into enrollments (student_id, course_id, enrollment_date, status, grade) values
(1, 1, '2026-07-01', 'Completed', 95.5),
(1, 2, '2026-07-02', 'Enrolled', null),
(1, 3, '2026-07-05', 'Enrolled', null),
(2, 1, '2026-07-03', 'Completed', 88.0),
(3, 4, '2026-07-04', 'Enrolled', null),
(4, 5, '2026-07-06', 'Enrolled', null),
(5, 1, '2026-07-07', 'Completed', 92.0),
(6, 2, '2026-07-08', 'Dropped', null),
(7, 3, '2026-07-09', 'Enrolled', null),
(8, 4, '2026-07-10', 'Enrolled', null),
(9, 5, '2026-07-11', 'Enrolled', null),
(10, 1, '2026-07-12', 'Completed', 75.5),
(2, 2, '2026-07-13', 'Enrolled', null),
(3, 5, '2026-07-14', 'Enrolled', null),
(4, 3, '2026-07-15', 'Enrolled', null);


-- Task 3: CRUD Queries
select * from students;
select * from courses;
select * from enrollments;

select * from students where city= 'riyadh' ;
select * from courses where category= 'ai';
select * from enrollments where status= 'Completed';

set sql_safe_updates=0;
update courses set price=665.66 where course_name='sql fundamentals';

select * from enrollments where status= 'dropped';
delete from enrollments where status ='dropped';
set sql_safe_updates=1;

-- task 4: string functions
select concat(full_name, ' is from ', city) as student_location from students;

select lower(full_name) as lower_name, lower(email) as lower_email from students;

select email, substring(email, 1, 10) as email_part from students;

select city, replace(city, 'riyadh', 'ruh') as modified_city from students;

select full_name, char_length(full_name) as name_length from students;

-- task 5: refining selections
select distinct category from courses;

select * from courses order by price desc;

select * from courses order by price desc limit 3;

select * from students where full_name like '%aziz%';

select * from students where email like '%\_%' escape '\\';

-- task 6: aggregate functions
select count(*) as total_students from students;

select course_id, count(*) as total_enrollments from enrollments group by course_id;

select avg(price) as average_price from courses;

select min(price) as min_price, max(price) as max_price from courses;

select category, count(*) as courses_count from courses group by category;

select course_id, count(*) as enrolled_students from enrollments group by course_id having count(*) > 1;

-- task 7: Operators, Dates, and CASE
select * from courses where price between 800.00 and 1200.00;

select * from courses where category in ('ai','web');

select * from students where (city ='riyadh' or city ='jeddah') and age > 20 ;

select * from enrollments where grade is null;

select student_id , course_id , grade,
	case
		when grade >= 90 then 'Excellent'
        when grade >= 60 then 'Passed'
        when grade is null then 'Not Graded'
        else 'Failed'
	end as grade_status from enrollments;

-- task 8: ALTER TABLE and Constraints
describe students;

alter table students add column phone_number varchar(15);

alter table students modify column full_name varchar(150);

alter table students add constraint unique_phone unique(phone_number);

-- all column nedd in next task w i can't drop one of them and this is an example to drop 
-- alter table students drop column phone_number;

-- task 9: Relationships and Joins
select students.full_name, courses.course_name 
from enrollments
inner join students on enrollments.student_id = students.student_id
inner join courses on enrollments.course_id = courses.course_id;

select courses.course_name, enrollments.student_id 
from courses
left join enrollments on courses.course_id = enrollments.course_id;

select instructors.full_name, courses.course_name 
from courses
right join instructors on courses.instructor_id = instructors.instructor_id;

select students.full_name, courses.course_name, enrollments.grade
from enrollments
join students on enrollments.student_id = students.student_id
join courses on enrollments.course_id = courses.course_id;

select students.full_name as student, courses.course_name, instructors.full_name as instructor, enrollments.grade
from enrollments
join students on enrollments.student_id = students.student_id
join courses on enrollments.course_id = courses.course_id
join instructors on courses.instructor_id = instructors.instructor_id;

select instructors.full_name, count(enrollments.student_id) as total_students
from instructors
join courses on instructors.instructor_id = courses.instructor_id
join enrollments on courses.course_id = enrollments.course_id
group by instructors.full_name;

-- task 10: views
create view vw_student_course_summary as
select students.full_name as student_name, students.email, courses.course_name, instructors.full_name as instructor_name, enrollments.status, enrollments.grade
from enrollments
join students on enrollments.student_id = students.student_id
join courses on enrollments.course_id = courses.course_id
join instructors on courses.instructor_id = instructors.instructor_id;

select * from vw_student_course_summary
where status = 'completed'
order by grade desc;

create or replace view vw_student_course_summary as
select students.full_name as student_name, students.email, courses.course_name, instructors.full_name as instructor_name, enrollments.status, enrollments.grade,
    case 
        when enrollments.grade >= 90 then 'excellent'
        when enrollments.grade >= 60 then 'passed'
        when enrollments.grade is null then 'not graded'
        else 'failed'
    end as grade_status
from enrollments
join students on enrollments.student_id = students.student_id
join courses on enrollments.course_id = courses.course_id
join instructors on courses.instructor_id = instructors.instructor_id;

select courses.course_name, count(enrollments.student_id) as total_students
from courses
left join enrollments on courses.course_id = enrollments.course_id
group by courses.course_name with rollup;

-- bonus task 11: window functions
select student_id, course_id, enrollment_date,
       row_number() over (partition by student_id order by enrollment_date desc) as latest_enrollment
from enrollments;

select course_name, category, price,
       dense_rank() over (partition by category order by price desc) as price_rank
from courses;

select student_id, course_id, grade,
       avg(grade) over (partition by course_id) as avg_course_grade
from enrollments;

select student_id, course_id, enrollment_date, grade,
       lag(grade) over (partition by student_id order by enrollment_date) as previous_course_grade
from enrollments;

-- to delete the whole database
drop database if exists training_center_db;