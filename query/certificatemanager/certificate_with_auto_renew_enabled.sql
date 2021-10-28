select
  -- Required Columns
  id as resource,
  case
    when imported then 'skip'
    when auto_renew_enabled then 'ok'
    else 'alarm'
  end as status,
  case
    when imported then name || ' is imported certificate without auto-renewal enabled.'
    when auto_renew_enabled then name || ' enabled with auto-renewal.'
    else name || ' not enabled with auto-renewal.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  ibm_certificate_manager_certificate;