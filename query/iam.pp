query "iam_access_group_with_public_access" {
  sql = <<-EOQ
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
      id as resource,
      case
        when name is null then 'ok'
        else 'alarm'
      end as status,
      case
        when name is null then 'No public access group configured in account.'
        else name || ' group configured in account.'
      end as reason,
      account_id
    from
      account_public_access;
  EOQ
}

query "iam_account_owner_no_api_key" {
  sql = <<-EOQ
    select
      acc.guid as resource,
      case
        when count(key.iam_id) > 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when count(key.iam_id) > 0 then 'Account owner API keys exist.'
        else 'No account owner API keys exist.'
      end as reason,
      acc.guid
    from
      ibm_account as acc,
      ibm_iam_api_key as key
    where
      acc.owner_unique_id = split_part(key.iam_id, '-', 2)
    group by
      acc.guid;
  EOQ
}

query "iam_restrict_api_key_service_id_creation" {
  sql = <<-EOQ
    select
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
      account_id
    from
      ibm_iam_account_settings;
  EOQ
}

query "iam_support_center_access_group_configured" {
  sql = <<-EOQ
    select
      id as resource,
      case
        when name ilike '%support%' then 'ok'
        else 'skip'
      end as status,
      case
        when name ilike '%support%' then name || ' specific to support center access group.'
        else name || ' not specific to support center access group.'
      end as reason,
      account_id
    from
      ibm_iam_access_group;
  EOQ
}

query "iam_user_api_key_age_90" {
  sql = <<-EOQ
    select
      key.crn as resource,
      case
        when key.iam_id like 'iam-ServiceId%' then 'skip'
        when key.created_at <= (current_date - interval '90' day) then 'alarm'
        else 'ok'
      end status,
      case
        when key.iam_id like 'iam-ServiceId%' then key.name || ' is a service ID API key.'
        else u.user_id || ' ' || key.name || ' created ' || to_char(key.created_at , 'DD-Mon-YYYY') ||
        ' (' || extract(day from current_timestamp - key.created_at) || ' days).'
      end as reason,
      key.account_id
    from
      ibm_iam_api_key as key
      left join ibm_iam_user as u on key.iam_id = u.iam_id;
  EOQ
}

query "iam_user_member_of_only_access_group" {
  sql = <<-EOQ
    with associated_policy_users as(
      select
        user_id,
        u.iam_id,
        u.account_id as account_id,
        roles
      from
        ibm_iam_user as u
        left join ibm_iam_user_policy as p on u.iam_id = p.iam_id
    )
    select
      distinct iam_id as resource,
      case
        when roles is null then 'ok'
        else 'alarm'
      end as status,
      case
        when roles is null then user_id || ' has no additional access policies assigned.'
        else user_id || ' has additional access policies assigned.'
      end as reason,
      account_id
    from
      associated_policy_users;
  EOQ
}

query "iam_user_mfa_enabled_all" {
  sql = <<-EOQ
    select
      account_id as resource,
      case
        when mfa = 'NONE' then 'alarm'
        else 'ok'
      end as status,
      case
        when mfa = 'NONE' then 'MFA not enabled for all users in account.'
        else 'MFA enabled for all users in account.'
      end as reason,
      account_id
    from
      ibm_iam_account_settings;
  EOQ
}

query "iam_user_with_valid_email" {
  sql = <<-EOQ
    select
      iam_id as resource,
      case
        when email !~ '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$' and email is null then 'alarm'
        else 'ok'
      end as status,
      case
        when email !~ '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$' and email is null then first_name || ' ' || last_name || ' has valid email.'
        else first_name || ' ' || last_name || ' has valid email.'
      end as reason,
      account_id
    from
      ibm_iam_user;
  EOQ
}

query "iam_user_with_valid_phone" {
  sql = <<-EOQ
    select
      iam_id as resource,
      case
        when phonenumber is not null and alt_phonenumber != '' then 'ok'
        else 'alarm'
      end as status,
      case
        when phonenumber is not null and alt_phonenumber != '' then first_name || ' ' || last_name || ' has phone number configured.'
        else first_name || ' ' || last_name || ' has no phone number configured.'
      end as reason,
      account_id
    from
      ibm_iam_user;
  EOQ
}