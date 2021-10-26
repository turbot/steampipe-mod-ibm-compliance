locals {
  cis_v100_10_common_tags = merge(local.cis_v100_common_tags, {
    cis_section_id = "10"
  })
}

benchmark "cis_v100_10" {
  title         = "10 IBM Cloud Certificate Manager"
  documentation = file("./cis_v100/docs/cis_v100_10.md")
  tags          = local.cis_v100_10_common_tags
  children = [
    control.cis_v100_10_1
  ]
}

control "cis_v100_10_1" {
  title         = "10.1 Ensure certificates generated through IBM Cloud Certificate Manager are  automatically renewed before expiration"
  description   = "Monitor login activity of the account owner to prevent unauthorized usage of the privileged account."
  documentation = file("./cis_v100/docs/cis_v100_10_1.md")
  sql           = query.certificate_with_auto_renew_enabled.sql

  tags = merge(local.cis_v100_10_common_tags, {
    cis_item_id = "10.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "securityadvisor"
  })
}
