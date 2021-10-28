select
  -- Required Columns
  key.crn as resource,
  case
    when key.iam_id like 'iam-ServiceId%' then 'skip'
    when key.created_at <= (current_date - interval '90' day) then 'alarm'
    else 'ok'
  end status,
  case
    when key.iam_id like 'iam-ServiceId%' then key.name || ' is a service ID API key.'
    else u.user_id || ' ' || key.name || ' created ' || to_char(key.created_at , 'DD-Mon-YYYY') ||
    ' (' || extract(day from current_timestamp - key.created_at) || ' days).'
  end as reason,
  -- Additional Dimensions
  key.account_id
from
  ibm_iam_api_key as key
  left join ibm_iam_user as u on key.iam_id = u.iam_id;