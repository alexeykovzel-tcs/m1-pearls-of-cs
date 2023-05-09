-- (a) Check
select
	*
from
	teacher
where
	extract(year from end_date) = 2003;
	
-- (a) Modify
update
	teacher
set
	end_date = to_date('01/02/2003', 'DD/MM/YYYY')
where
	teacher_id = 1;
	
-- (c) Discard
update
	teacher
set
	end_date = to_date('17/12/2022', 'DD/MM/YYYY')
where
	teacher_id = 1;


-- (b) Check
select
	c.course_code, c.course, ce.year, ce.quarter
from
	course c, course_edition ce
where
	ce.year = 2003 -- or 2004
	and ce.quarter = 4
	and c.course_code = ce.course_code;
	
-- (b) Modify
insert into
	course_edition (main_teacher_id, course_code, year, quarter)
select
	ce.main_teacher_id, ce.course_code, 2004, ce.quarter
from
	course_edition ce
where
	ce.year = 2003
	and ce.quarter = 4;
	
-- (b) Discard
delete from
	course_edition as ce
where
	ce.year = 2004
	and ce.quarter = 4


-- (c) Check
select
	c.course_code, c.course, tr.teacher, ts.year, ts.quarter
from
	course c, teacher tr, teaches ts
where
	lower(tr.teacher) like '%brinksma%'
	and ts.teacher_id = tr.teacher_id
	and ts.course_code = c.course_code;
	
-- (c) Add Prof.Dr. M. Huisman to 'teacher' table
insert into
	teacher (teacher_id, teacher, start_date, end_date)
values
	(0, upper('Prof.Dr. M. Huisman'), 
	to_date('17/12/2015', 'DD/MM/YYYY'),
	to_date('17/12/2022', 'DD/MM/YYYY'))
	
-- (c) Modify
update
	teaches ts
set 
	teacher_id = (select teacher_id from teacher where lower(teacher) like '%huisman%')
where
	ts.teacher_id = (select teacher_id from teacher where lower(teacher) like '%brinksma%')
	and ts.year >= 2004;

-- (c) Discard
update
	teaches ts
set 
	teacher_id = (select teacher_id from teacher where lower(teacher) like '%brinksma%')
where
	ts.teacher_id = (select teacher_id from teacher where lower(teacher) like '%huisman%')
	and ts.year >= 2004;


	