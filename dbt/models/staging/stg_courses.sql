select
  course_id,
  trim(course_name) as course_name,
  trim(faculty) as faculty,
  cast(credits as number(3,0)) as credits,
  cast(created_at as timestamp_ntz) as created_at
from {{ ref('raw_courses') }}