select
  -- Required Columns
  iam_id as resource,
  case
    when phonenumber is not null and alt_phonenumber != '' then 'ok'
    else 'alarm'
  end as status,
  case
    when phonenumber is not null and alt_phonenumber != '' then first_name || ' ' || last_name || ' has phone number configured.'
    else first_name || ' ' || last_name || ' has no phone number configured.'
  end as reason,
  -- Additional Dimensions
  account_id
from
  ibm_iam_user;