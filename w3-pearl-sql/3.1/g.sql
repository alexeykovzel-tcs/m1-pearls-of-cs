select
	language, count(distinct movie), count(distinct person)
from
	movies.language, movies.movie, movies.acts, movies.person
where
	movie.mid = language.mid and
	acts.mid = movie.mid and
	person.pid = acts.pid
group by language;