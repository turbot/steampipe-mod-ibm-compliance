locals {
  cis_v100_1_common_tags = merge(local.cis_v100_common_tags, {
    cis_section_id = "1"
  })
}

benchmark "cis_v100_1" {
  title         = "1 IAM"
  documentation = file("./cis_v100/docs/cis_v100_1.md")
  children = [
    control.cis_v100_1_1,
    control.cis_v100_1_2,
    control.cis_v100_1_3,
    control.cis_v100_1_4,
    control.cis_v100_1_5,
    control.cis_v100_1_6,
    control.cis_v100_1_7,
    control.cis_v100_1_8,
    control.cis_v100_1_9,
    control.cis_v100_1_10,
    control.cis_v100_1_11,
    control.cis_v100_1_12,
    control.cis_v100_1_13,
    control.cis_v100_1_14,
    control.cis_v100_1_15,
    control.cis_v100_1_16,
    control.cis_v100_1_17,
    control.cis_v100_1_18,
    control.cis_v100_1_19,
  ]

  tags = merge(local.cis_v100_1_common_tags, {
    service = "IBM/IAM"
    type    = "Benchmark"
  })
}

control "cis_v100_1_1" {
  title         = "1.1 Monitor account owner for frequent, unexpected, or unauthorized logins"
  description   = "Monitor login activity of the account owner to prevent unauthorized usage of the privileged account."
  documentation = file("./cis_v100/docs/cis_v100_1_1.md")
  sql           = query.manual_control.sql

  tags = merge(local.cis_v100_1_common_tags, {
    cis_item_id = "1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/IAM"
  })
}

control "cis_v100_1_2" {
  title         = "1.2 Ensure API keys unused for 180 days are detected and optionally disabled"
  description   = "Monitor API key usage in your account and search for API keys that are unused or used infrequently."
  documentation = file("./cis_v100/docs/cis_v100_1_2.md")
  sql           = query.manual_control.sql

  tags = merge(local.cis_v100_1_common_tags, {
    cis_item_id = "1.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/IAM"
  })
}

control "cis_v100_1_3" {
  title         = "1.3 Ensure API keys are rotated every 90 days"
  description   = "Replace production API keys with new API keys regularly, every 90 days for example, as a best practice to secure your account."
  documentation = file("./cis_v100/docs/cis_v100_1_3.md")
  sql           = query.iam_user_api_key_age_90.sql

  tags = merge(local.cis_v100_1_common_tags, {
    cis_item_id = "1.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/IAM"
  })
}

control "cis_v100_1_4" {
  title         = "1.4 Restrict user API key creation and service ID creation in the account via IAM roles"
  description   = "Use IAM settings to restrict user API key creation and service ID (and related API key) creation in the account. Enable both settings to restrict all users in the account from creating user API keys and service IDs except those with an IAM policy that explicitly allows it."
  documentation = file("./cis_v100/docs/cis_v100_1_4.md")
  sql           = query.iam_restrict_api_key_service_id_creation.sql

  tags = merge(local.cis_v100_1_common_tags, {
    cis_item_id = "1.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/IAM"
  })
}

control "cis_v100_1_5" {
  title         = "1.5 Ensure no owner account API key exists"
  description   = "API keys by definition allow access to your account and resources in your account. The API key inherits all assigned access for the user identity for which it is created, therefore an API key created by an account owner has account-owner level access to resources in the account."
  documentation = file("./cis_v100/docs/cis_v100_1_5.md")
  sql           = query.iam_account_owner_no_api_key.sql

  tags = merge(local.cis_v100_1_common_tags, {
    cis_item_id = "1.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/IAM"
  })
}

control "cis_v100_1_6" {
  title         = "1.6 Ensure compliance with IBM Cloud password requirements"
  description   = "A strong password is a very important step towards account security and safety. Passwords should never be shared with anyone, and must follow the strong password requirements."
  documentation = file("./cis_v100/docs/cis_v100_1_6.md")
  sql           = query.manual_control.sql

  tags = merge(local.cis_v100_1_common_tags, {
    cis_item_id = "1.6"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/IAM"
  })
}

control "cis_v100_1_7" {
  title         = "1.7 Ensure multi-factor authentication (MFA) is enabled for all users in account"
  description   = "Requires users to provide multiple factors of login credentials to authenticate their identity and gain access to IBM Cloud resources."
  documentation = file("./cis_v100/docs/cis_v100_1_7.md")
  sql           = query.iam_user_mfa_enabled_all.sql

  tags = merge(local.cis_v100_1_common_tags, {
    cis_item_id = "1.7"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/IAM"
  })
}

control "cis_v100_1_8" {
  title         = "1.8 Ensure multi-factor authentication (MFA) is enabled for the account owner"
  description   = "Requires account owners to provide multiple factors of login credentials to authenticate their identity and gain access to IBM Cloud resources."
  documentation = file("./cis_v100/docs/cis_v100_1_8.md")
  sql           = query.iam_user_mfa_enabled_all.sql

  tags = merge(local.cis_v100_1_common_tags, {
    cis_item_id = "1.8"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/IAM"
  })
}

control "cis_v100_1_9" {
  title         = "1.9 Ensure multi-factor authentication (MFA) is enabled at the account level"
  description   = "Requires users to provide multiple factors of login credentials to authenticate their identity and gain access to IBM Cloud resources."
  documentation = file("./cis_v100/docs/cis_v100_1_9.md")
  sql           = query.iam_user_mfa_enabled_all.sql

  tags = merge(local.cis_v100_1_common_tags, {
    cis_item_id = "1.9"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/IAM"
  })
}

control "cis_v100_1_10" {
  title         = "1.10 Ensure contact email is valid"
  description   = "In order to receive emails and account alerts related to an IBM Cloud account, a valid email address should always be on record with IBM Cloud. If you lose access to an email address, you should update your email address on record to ensure continuity of correspondence."
  documentation = file("./cis_v100/docs/cis_v100_1_10.md")
  sql           = query.iam_user_with_valid_email.sql

  tags = merge(local.cis_v100_1_common_tags, {
    cis_item_id = "1.10"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/IAM"
  })
}

control "cis_v100_1_11" {
  title         = "1.11 Ensure contact phone number is valid"
  description   = "A valid phone number should be on record with IBM Cloud in the event that IBM needs to contact you regarding your IBM Cloud account."
  documentation = file("./cis_v100/docs/cis_v100_1_11.md")
  sql           = query.iam_user_with_valid_phone.sql

  tags = merge(local.cis_v100_1_common_tags, {
    cis_item_id = "1.11"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/IAM"
  })
}

control "cis_v100_1_12" {
  title         = "1.12 Ensure IAM users are members of access groups and IAM policies are  assigned only to access groups"
  description   = "Simplify and secure the access management process by using access groups when you assign access to groups of users with identical access needs."
  documentation = file("./cis_v100/docs/cis_v100_1_12.md")
  sql           = query.iam_user_with_valid_phone.sql

  tags = merge(local.cis_v100_1_common_tags, {
    cis_item_id = "1.12"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/IAM"
  })
}

control "cis_v100_1_13" {
  title         = "1.13 Ensure a support access group has been created to manage incidents with  IBM Support"
  description   = "Support cases are used to raise issues to IBM Cloud. Access to IBM Cloud Support Center is managed via IAM roles."
  documentation = file("./cis_v100/docs/cis_v100_1_13.md")
  sql           = query.iam_support_center_access_group_configured.sql

  tags = merge(local.cis_v100_1_common_tags, {
    cis_item_id = "1.13"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/IAM"
  })
}

control "cis_v100_1_14" {
  title         = "1.14 Minimize the number of users with admin privileges in the account"
  description   = "Comply with the principle of granting least privilege by using Access Groups to manage admin privileges and by avoiding the use of broadly scoped access policies."
  documentation = file("./cis_v100/docs/cis_v100_1_14.md")
  sql           = query.manual_control.sql

  tags = merge(local.cis_v100_1_common_tags, {
    cis_item_id = "1.14"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/IAM"
  })
}

control "cis_v100_1_15" {
  title         = "1.15 Minimize the number of Service IDs with admin privileges in the account"
  description   = "Comply with the principle of granting least privilege by using Access Groups to manage admin privileges and by avoiding the use of many Service IDs with Administrative Privileges."
  documentation = file("./cis_v100/docs/cis_v100_1_15.md")
  sql           = query.manual_control.sql

  tags = merge(local.cis_v100_1_common_tags, {
    cis_item_id = "1.15"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/IAM"
  })
}

control "cis_v100_1_16" {
  title         = "1.16 Ensure IAM does not allow public access to Cloud Object Storage"
  description   = "IBM Cloud features the capability for users with specific access roles to create access policies that allow all users(authenticated and non-authenticated) to access resources in the account. This “all users” access in turn ends up in public (including non-authenticated) access to resources. Determine if this capability is required by your organization and disable if not required."
  documentation = file("./cis_v100/docs/cis_v100_1_16.md")
  sql           = query.iam_access_group_with_public_access.sql

  tags = merge(local.cis_v100_1_common_tags, {
    cis_item_id = "1.16"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/IAM"
  })
}

control "cis_v100_1_17" {
  title         = "1.17 Ensure Inactive User Accounts are Suspend"
  description   = "Revoke access privileges for users in an IBM Cloud account that are inactive, typically defined as user accounts with no logins in a given time frame."
  documentation = file("./cis_v100/docs/cis_v100_1_17.md")
  sql           = query.manual_control.sql

  tags = merge(local.cis_v100_1_common_tags, {
    cis_item_id = "1.17"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/IAM"
  })
}

control "cis_v100_1_18" {
  title         = "1.18 Enable audit logging for IBM Cloud Identity and Access Management"
  description   = "Use the IBM Cloud Activity Tracker with LogDNA service to monitor certain IAM events."
  documentation = file("./cis_v100/docs/cis_v100_1_18.md")
  sql           = query.manual_control.sql

  tags = merge(local.cis_v100_1_common_tags, {
    cis_item_id = "1.18"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/IAM"
  })
}

control "cis_v100_1_19" {
  title         = "1.19 Ensure Identity Federation is set up with a Corporate IDP"
  description   = "Allow users to log in to IBM Cloud by using their corporate Identity Provider (IdP) to authenticate."
  documentation = file("./cis_v100/docs/cis_v100_1_19.md")
  sql           = query.manual_control.sql

  tags = merge(local.cis_v100_1_common_tags, {
    cis_item_id = "1.19"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/IAM"
  })
}
