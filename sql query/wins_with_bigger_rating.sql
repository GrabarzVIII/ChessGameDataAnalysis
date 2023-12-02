with
	total_games as
	(
	select 
		count(game_id) as total
	from chess_games
	)
select 
	round(count(cg.game_id)/tg.total * 100, 2) 							as bigger_rate_wins_percentage
	,round(((tg.total - count(cg.game_id))/tg.total)*100, 2)			as lower_rate_wins_or_darw_percentage
from chess_games cg
cross join total_games tg
where (winner = 'White' and white_rating > black_rating) or (winner = 'Black' and black_rating > white_rating)
group by tg.total


	


