select
  term_id,
  trim(term_name) as term_name,
  cast(start_date as date) as start_date,
  cast(end_date as date) as end_date
from {{ ref('raw_terms') }}