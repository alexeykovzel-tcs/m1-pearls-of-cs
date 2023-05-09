-- 1-st Query
select 
	student_id, student, study
from
	student, study
where
	student.study_code = study.study_code
	and study.study = 'BIT';

-- 2-nd Query
select
	c.course_code, c.course, tr.teacher
from
	course c, teacher tr, teaches ts
where
	ts.teacher_id = tr.teacher_id
	and ts.course_code = c.course_code
	and lower(tr.teacher) like '%keulen%';
	
-- 3-rd Query
select
	tr.teacher, c.course_code, c.course, c.description
from
	course c, teacher tr, teaches ts
where
	ts.teacher_id = tr.teacher_id
	and ts.course_code = c.course_code
	and (lower(description) like '%databases%' 
		or lower(course) like '%databases%');