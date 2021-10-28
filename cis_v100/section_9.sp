locals {
  cis_v100_9_common_tags = merge(local.cis_v100_common_tags, {
    cis_section_id = "9"
  })
}

benchmark "cis_v100_9" {
  title         = "9 Security and Compliance"
  documentation = file("./cis_v100/docs/cis_v100_9.md")
  tags          = local.cis_v100_9_common_tags
  children = [
    control.cis_v100_9_1
  ]
}

control "cis_v100_9_1" {
  title         = "9.1 Ensure alerts are enabled for vulnerabilities discovered in container images in Container Registry"
  description   = "Monitor login activity of the account owner to prevent unauthorized usage of the privileged account."
  documentation = file("./cis_v100/docs/cis_v100_9_1.md")
  sql           = query.manual_control.sql

  tags = merge(local.cis_v100_9_common_tags, {
    cis_item_id = "9.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "securityadvisor"
  })
}
