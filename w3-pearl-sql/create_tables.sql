drop table if exists teaches,
	final_grade,
	course_edition,
	course,
	teacher,
	student,
	study;

create table study (
	study_code serial primary key,
	study char(3) not null
);

create table student (
	student_id int primary key,
	study_code int,
	student varchar,
	foreign key (study_code) references study(study_code)
);

create table teacher (
	teacher_id int primary key,
	teacher varchar,
	start_date date,
	end_date date
);

create table course (
	course_code int primary key,
	study_code int,
	course varchar,
	description varchar,
	ects int,
	foreign key (study_code) references study(study_code)
);

create table course_edition (
	course_code int,
	year int,
	quarter int,
	main_teacher_id int,
	primary key (course_code, year, quarter),
	foreign key (course_code) references course(course_code),
	foreign key (main_teacher_id) references teacher(teacher_id)
);

create table final_grade (
	course_code int,
	student_id int,
	grade numeric(3,1),
	name varchar,
	primary key (course_code, student_id),
	foreign key (course_code) references course(course_code),
	foreign key (student_id) references student(student_id)
);

create table teaches (
	teacher_id int,
	course_code int,
	year int,
	quarter int,
	primary key (teacher_id, course_code, year, quarter),
	foreign key (teacher_id) references teacher(teacher_id),
	foreign key (course_code, year, quarter) references course_edition (course_code, year, quarter)
);