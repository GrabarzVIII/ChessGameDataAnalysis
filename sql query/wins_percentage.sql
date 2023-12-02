with
	total_games as
	(
	select
		count(game_id) as total_games_number
	from chess_games
	)
select
	distinct(cg.winner)											as color
	,round(count(cg.game_id)/tg.total_games_number * 100, 2) 	as percentage_of_wins
from chess_games cg 
cross join total_games tg
group by 1, tg.total_games_number
