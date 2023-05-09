select 
	person.name, role, movie.name, year
from
	movies.person, movies.acts, movies.movie
where 
	person.pid = acts.pid and
	movie.mid = acts.mid and
	role like '%Tom%'
order by person.name asc, year asc;