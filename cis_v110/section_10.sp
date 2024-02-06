locals {
  cis_v110_10_common_tags = merge(local.cis_v110_common_tags, {
    cis_section_id = "10"
  })
}

benchmark "cis_v110_10" {
  title         = "10 IBM Cloud Certificate Manager"
  documentation = file("./cis_v110/docs/cis_v110_10.md")
  children = [
    control.cis_v110_10_1
  ]

  tags = merge(local.cis_v110_10_common_tags, {
    service = "IBM/CertificateManager"
    type    = "Benchmark"
  })
}

control "cis_v110_10_1" {
  title         = "10.1 Ensure certificates generated through IBM Cloud Certificate Manager are automatically renewed before expiration"
  description   = "Monitor login activity of the account owner to prevent unauthorized usage of the privileged account."
  documentation = file("./cis_v110/docs/cis_v110_10_1.md")
  query         = query.certificate_with_auto_renew_enabled

  tags = merge(local.cis_v110_10_common_tags, {
    cis_item_id = "10.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "IBM/CertificateManager"
  })
}
