select
  -- Required Columns
  account_id as resource,
  case
    when mfa = 'NONE' then 'alarm'
    else 'ok'
  end as status,
  case
    when mfa = 'NONE' then 'MFA not enabled for all users in account.'
    else 'MFA enabled for all users in account.'
  end as reason,
  -- Additional Dimensions
  account_id
from
  ibm_iam_account_settings;