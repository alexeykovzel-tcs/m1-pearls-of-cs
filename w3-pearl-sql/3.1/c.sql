select
	name, year
from
	movies.movie inner join movies.genre
	on genre.mid = movie.mid
where
	genre.genre = 'Drama';