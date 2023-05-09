truncate table teaches, 
	final_grade,
	course_edition,
	course,
	teacher,
	student,
	study;

-- Insert Studies
insert into
	study (study) -- study_code, study
select distinct
	study
from
	srs.education;


-- Insert Courses
insert into
	course (study_code, course_code, course, description, ects)
select
	(select distinct
		study_code
	from
		srs.education, study
	where
		education.course_code = courses.course_code
		and education.study = study.study),
	courses.course_code, course, description, 5 -- Ects are finctional
from
	srs.courses
order by
	course_code;


-- Insert Teachers
insert into
	teacher (teacher_id, teacher, start_date, end_date)
select distinct
	teacher_id, teacher, 
	to_date('17/12/2015', 'DD/MM/YYYY'),
	to_date('17/12/2022', 'DD/MM/YYYY') -- Dates are fictional
from
	srs.education
order by
	teacher_id;


-- Insert course editions
insert into
	course_edition (main_teacher_id, course_code, year, quarter)
select
	teacher_id, course_code, year, quarter
from
	srs.education
order by
	course_code, year, quarter;


-- Insert teacher-courses
insert into
	teaches (teacher_id, course_code, year, quarter)
select
	teacher_id, course_code, year, quarter
from
	srs.education
order by
	year, quarter, course_code, teacher_id;


-- Insert students
insert into
	student (student_id, student, study_code)
select
	student_id, student,
	(select study_code from study
	where (array_agg(education.study))[1] = study.study)
from
	srs.grades, srs.education
where
	grades.course_code = education.course_code
	and	grades.year = education.year
	and grades.quarter = education.quarter
group by
	student_id, student
order by
	student_id;


-- Insert final grades
insert into
	final_grade (course_code, student_id, name, grade)
select
	course_code, student_id, student, avg(grade)
from
	srs.grades
group by
	student_id, course_code, student
order by
	student_id, course_code;