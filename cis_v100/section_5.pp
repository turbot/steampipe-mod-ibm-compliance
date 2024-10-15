locals {
  cis_v100_5_common_tags = merge(local.cis_v100_common_tags, {
    cis_section_id = "5"
  })
}

benchmark "cis_v100_5" {
  title         = "5 Cloudant"
  documentation = file("./cis_v100/docs/cis_v100_4.md")
  children = [
    control.cis_v100_5_1,
    control.cis_v100_5_2,
    control.cis_v100_5_3,
  ]

  tags = merge(local.cis_v100_5_common_tags, {
    service = "IBM/Cloudant"
    type    = "Benchmark"
  })
}

control "cis_v100_5_1" {
  title         = "5.1 Ensure Cloudant encryption is set to On"
  documentation = file("./cis_v100/docs/cis_v100_5_1.md")
  query         = query.manual_control

  tags = merge(local.cis_v100_5_common_tags, {
    cis_item_id = "5.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "IBM/Cloudant"
  })
}

control "cis_v100_5_2" {
  title         = "5.2 Ensure IBM Cloudant encryption is enabled with customer managed keys"
  documentation = file("./cis_v100/docs/cis_v100_5_2.md")
  query         = query.manual_control

  tags = merge(local.cis_v100_5_common_tags, {
    cis_item_id = "5.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/Cloudant"
  })
}

control "cis_v100_5_3" {
  title         = "5.3 Ensure IBM Cloudant is only accessible via HTTPS or TLS Connections"
  documentation = file("./cis_v100/docs/cis_v100_5_3.md")
  query         = query.manual_control

  tags = merge(local.cis_v100_5_common_tags, {
    cis_item_id = "5.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "IBM/Cloudant"
  })
}
