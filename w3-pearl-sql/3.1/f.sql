select
	person.pid, person.name, count(directs)
from
	movies.person inner join movies.directs
	on person.pid = directs.pid
group by
	person.pid
order by
	count(directs) desc;