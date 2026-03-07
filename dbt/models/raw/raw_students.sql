select
  'S' || lpad(seq4()::string, 6, '0') as student_id,
  dateadd(day, -uniform(18*365, 45*365, random()), current_date()) as dob,
  array_construct('F','M','X')[uniform(0,3,random())]::string as gender,
  array_construct('Macquarie Park','North Ryde','Chatswood','Parramatta','Epping')[uniform(0,5,random())]::string as suburb,
  dateadd(day, -uniform(0, 1500, random()), current_timestamp()) as created_at
from table(generator(rowcount => 10000))