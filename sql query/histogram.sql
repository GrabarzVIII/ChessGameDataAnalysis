select
  floor((turns - 1) / 10) * 10 + 1 AS range_start,
  floor((turns - 1) / 10) * 10 + 10 AS range_end,
  count(*) AS frequency
from chess_games cg 
where floor((turns - 1) / 10) * 10 + 1 <= (select floor((max(turns) - 1) / 10) * 10 + 1 from chess_games)
group by 1,2
order by range_start;
