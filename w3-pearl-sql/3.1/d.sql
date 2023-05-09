-- 1-st option:

select
	name, year
from
	movies.movie
where
	exists (select * from movies.genre where genre = 'Drama' and mid = movie.mid) and
	exists (select * from movies.genre where genre = 'Crime' and mid = movie.mid);
	
-- 2-nd option:

select
	name, year
from
	movies.movie, movies.genre genre1, movies.genre genre2
where
	genre1.mid = movie.mid and
	genre2.mid = movie.mid and
	genre1.genre = 'Drama' and
	genre2.genre = 'Crime'