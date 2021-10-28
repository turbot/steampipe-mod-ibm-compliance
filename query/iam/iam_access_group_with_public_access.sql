with account_public_access as (
  select
    name,
    id,
    account_id,
    count(*) as public_access_grp_no
  from
    ibm_iam_access_group
  where name = 'Public Access'
  group by name,id,account_id
)
select
  -- Required Columns
  id as resource,
  case
    when name is null then 'ok'
    else 'alarm'
  end as status,
  case
    when name is null then 'No public access group configured in account.'
    else name || ' group configured in account.'
  end as reason,
  -- Additional Dimensions
  account_id
from
  account_public_access;