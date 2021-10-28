select
  -- Required Columns
  id as resource,
  case
    when name ilike '%support%' then 'ok'
    else 'skip'
  end as status,
  case
    when name ilike '%support%' then name || ' specific to support center access group.'
    else name || ' not specific to support center access group.'
  end as reason,
  -- Additional Dimensions
  account_id
from
  ibm_iam_access_group;