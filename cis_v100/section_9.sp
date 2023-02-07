locals {
  cis_v100_9_common_tags = merge(local.cis_v100_common_tags, {
    cis_section_id = "9"
  })
}

benchmark "cis_v100_9" {
  title         = "9 Security and Compliance"
  documentation = file("./cis_v100/docs/cis_v100_9.md")
  children = [
    control.cis_v100_9_1
  ]

  tags = merge(local.cis_v100_9_common_tags, {
    service = "IBM/SCC"
    type    = "Benchmark"
  })
}

control "cis_v100_9_1" {
  title         = "9.1 Ensure alerts are enabled for vulnerabilities discovered in container images in Container Registry"
  description   = "Monitor login activity of the account owner to prevent unauthorized usage of the privileged account."
  documentation = file("./cis_v100/docs/cis_v100_9_1.md")
  query         = query.manual_control

  tags = merge(local.cis_v100_9_common_tags, {
    cis_item_id = "9.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "IBM/SCC"
  })
}
