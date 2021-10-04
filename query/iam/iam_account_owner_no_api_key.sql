select
  -- Required Columns
  acc.guid as resource,
  case
    when count(key.iam_id) > 0 then 'alarm'
    else 'ok'
  end as status,
  case
    when count(key.iam_id) > 0 then 'Account owner API keys exist.'
    else 'No account owner API keys exist.'
  end as reason,
  -- Additional Dimensions
  acc.guid
from
  ibm_account as acc,
  ibm_iam_api_key as key
where
  key.iam_id = acc.owner_guid
group by ;