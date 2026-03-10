select
  enrollment_id,
  student_id,
  course_id,
  term_id,
  cast(enrolled_at as timestamp_ntz) as enrolled_at,
  upper(trim(grade)) as grade,
  lower(trim(status)) as status,
  cast(updated_at as timestamp_ntz) as updated_at
from {{ ref('raw_enrollments') }}