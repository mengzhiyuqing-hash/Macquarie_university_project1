select
  'E' || lpad(seq4()::string, 8, '0') as enrollment_id,
  'S' || lpad(uniform(0,10000,random())::string, 6, '0') as student_id,
  'C' || lpad(uniform(0,300,random())::string, 4, '0') as course_id,
  'T' || lpad(uniform(0,12,random())::string, 2, '0') as term_id,
  dateadd(day, -uniform(0, 900, random()), current_timestamp()) as enrolled_at,
  array_construct('HD','D','C','P','F')[uniform(0,5,random())]::string as grade,
  array_construct('active','completed','withdrawn')[uniform(0,3,random())]::string as status,
  dateadd(day, -uniform(0, 300, random()), current_timestamp()) as updated_at
from table(generator(rowcount => 100000))