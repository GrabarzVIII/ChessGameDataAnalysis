with
	total_games as
	(
	select 
		count(game_id) as totals
	from chess_games
	)
select
	distinct(cg.victory_status)
	,round((count(cg.game_id)/tg.totals) * 100,2) as percenage_of_ends
from chess_games cg
cross join total_games tg
where victory_status is not null 
group by 1, tg.totals
order by 2