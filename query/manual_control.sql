select
  -- Required Columns
  guid as resource,
  'info' as status,
  'Manual verification required.' as reason,
  -- Additional Dimensions
  guid
from
  ibm_account;