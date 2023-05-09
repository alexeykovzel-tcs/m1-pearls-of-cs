select
	year, count(year)
from
	movies.movie
group by
	year
order by
	year desc;