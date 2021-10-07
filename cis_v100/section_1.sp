locals {
  cis_v100_1_common_tags = merge(local.cis_v100_common_tags, {
    cis_section_id = "1"
  })
}

benchmark "cis_v100_1" {
  title         = "1 IAM"
  documentation = file("./cis_v100/docs/cis_v100_1.md")
  tags          = local.cis_v100_1_common_tags
  children = [
    control.cis_v100_1_3,
    control.cis_v100_1_4,
    control.cis_v100_1_5,
    control.cis_v100_1_7,
    control.cis_v100_1_10,
    control.cis_v100_1_11
  ]
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
    service     = "iam"
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
    service     = "iam"
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
    service     = "iam"
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
    service     = "iam"
  })
}

control "cis_v100_1_10" {
  title         = "1.10 Ensure contact email is valid"
  description   = "In order to receive emails and account alerts related to an IBM Cloud account, a valid email address should always be on record with IBM Cloud. If you lose access to an email address, you should update your email address on record to ensure continuity of correspondence."
  documentation = file("./cis_v100/docs/cis_v100_1_10.md")
  sql           = query.manual_control.sql

  tags = merge(local.cis_v100_1_common_tags, {
    cis_item_id = "1.10"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "iam"
  })
}

control "cis_v100_1_11" {
  title         = "1.11 Ensure contact phone number is valid"
  description   = "A valid phone number should be on record with IBM Cloud in the event that IBM needs to contact you regarding your IBM Cloud account."
  documentation = file("./cis_v100/docs/cis_v100_1_11.md")
  sql           = query.manual_control.sql

  tags = merge(local.cis_v100_1_common_tags, {
    cis_item_id = "1.11"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "iam"
  })
}
