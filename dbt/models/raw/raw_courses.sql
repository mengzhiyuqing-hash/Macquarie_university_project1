select
  'C' || lpad(seq4()::string, 4, '0') as course_id,
  'Course_' || seq4()::string as course_name,
  array_construct('Business','Engineering','Arts','Science','Medicine')[uniform(0,5,random())]::string as faculty,
  array_construct(3,6,9,12)[uniform(0,4,random())]::number as credits,
  dateadd(day, -uniform(0, 2000, random()), current_timestamp()) as created_at
from table(generator(rowcount => 300))