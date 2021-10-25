select
  -- Required Columns
  iam_id as resource,
  case
    when email !~ '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$' and email is null then 'alarm'
    else 'ok'
  end as status,
  case
    when email !~ '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$' and email is null then first_name || ' ' || last_name || ' has valid email.'
    else first_name || ' ' || last_name || ' has valid email.'
  end as reason,
  -- Additional Dimensions
  account_id
from
  ibm_iam_user;