select
  student_id,
  cast(dob as date) as dob,
  upper(trim(gender)) as gender,
  trim(suburb) as suburb,
  cast(created_at as timestamp_ntz) as created_at
from {{ ref('raw_students') }}