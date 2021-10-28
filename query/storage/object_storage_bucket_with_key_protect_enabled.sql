select
  -- Required Columns
  title as resource,
  case
    when sse_kp_enabled then 'ok'
    else 'alarm'
  end as status,
  case
    when sse_kp_enabled then title || ' associated with Key Protect key management service.'
    else title || ' not associated with Key Protect key management service.'
  end as reason,
  -- Additional Dimensions
  region,
  acc.guid as account_id
from
  ibm_cos_bucket,
  ibm_account as acc;