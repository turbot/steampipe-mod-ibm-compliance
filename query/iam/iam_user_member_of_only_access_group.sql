with associated_policy_users as(
select
  user_id,
  u.iam_id,
  u.account_id as account_id,
  roles
  from
    ibm_iam_user u
    left join ibm_iam_user_policy p on u.iam_id = p.iam_id
)
select
  -- Required Columns
  distinct iam_id as resource,
  case
    when roles is null then 'ok'
    else 'alarm'
  end as status,
  case
    when roles is null then user_id || ' has no additional access policies assigned.'
    else user_id || ' has additional access policies assigned.'
  end as reason,
  -- Additional Dimensions
  account_id
from
  associated_policy_users;