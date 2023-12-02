select 
	distinct(opening_shortname)
	,count(game_id) 
from chess_games cg 
group by 1
order by 2 desc
limit 10