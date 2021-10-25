select
  -- Required Columns
  title as resource,
  case
    when sse_kp_customer_root_key_crn != '<null>' then 'ok'
    else 'alarm'
  end as status,
  case
    when sse_kp_customer_root_key_crn != '<null>' then title || ' configured with CMK.'
    else title || ' not configured with CMK.'
  end as reason,
  -- Additional Dimensions
  region,
  acc.guid as account_id
from
  ibm_cos_bucket,
  ibm_account as acc;