select
  -- Required Columns
  guid as resource,
  'info' as status,
  'SDK support unavailable.' as reason,
  -- Additional Dimensions
  guid
from
  ibm_account;