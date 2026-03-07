select
  'T' || lpad(seq4()::string, 2, '0') as term_id,
  'Term_' || seq4()::string as term_name,
  dateadd(day, seq4()*120, '2022-01-01'::date) as start_date,
  dateadd(day, seq4()*120 + 90, '2022-01-01'::date) as end_date
from table(generator(rowcount => 12))