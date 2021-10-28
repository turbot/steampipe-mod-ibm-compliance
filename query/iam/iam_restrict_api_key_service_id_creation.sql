select
  -- Required Columns
  account_id as resource,
  case
    when restrict_create_service_id = 'RESTRICTED' and restrict_create_platform_api_key = 'RESTRICTED' then 'ok'
    else 'alarm'
  end as status,
  case
    when restrict_create_service_id <> 'RESTRICTED' and restrict_create_platform_api_key <> 'RESTRICTED'
      then 'Both API key and service ID creation are not restricted.'
    when restrict_create_service_id <> 'RESTRICTED' and restrict_create_platform_api_key = 'RESTRICTED'
      then 'API key creation restricted, but service ID creation not restricted.'
    when restrict_create_service_id = 'RESTRICTED' and restrict_create_platform_api_key <> 'RESTRICTED'
      then 'Service ID creation restricted, but API key creation not restricted.'
    else 'Both API key and service ID creation are restricted.'
  end as reason,
  -- Additional Dimensions
  account_id
from
  ibm_iam_account_settings;