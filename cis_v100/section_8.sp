locals {
  cis_v100_8_common_tags = merge(local.cis_v100_common_tags, {
    cis_section_id = "8"
  })
}

locals {
  cis_v100_8_1_common_tags = merge(local.cis_v100_8_common_tags, {
    cis_section_id = "8.1"
  })
}

benchmark "cis_v100_8" {
  title         = "8 Key Management"
  documentation = file("./cis_v100/docs/cis_v100_8.md")
  children = [
    benchmark.cis_v100_8_1
  ]

  tags = merge(local.cis_v100_8_common_tags, {
    service = "IBM/KMS"
    type    = "Benchmark"
  })
}

benchmark "cis_v100_8_1" {
  title         = "8.1 IBM Key Protect for IBM Cloud"
  documentation = file("./cis_v100/docs/cis_v100_8_1.md")
  children = [
    control.cis_v100_8_1_1,
    control.cis_v100_8_1_2,
  ]

  tags = merge(local.cis_v100_8_1_common_tags, {
    service = "IBM/KMS"
    type    = "Benchmark"
  })
}

control "cis_v100_8_1_1" {
  title         = "8.1.1 Ensure IBM Key Protect has automated rotation for customer managed keys  enabled"
  documentation = file("./cis_v100/docs/cis_v100_8_1_1.md")
  sql           = query.manual_control.sql

  tags = merge(local.cis_v100_8_1_common_tags, {
    cis_item_id = "8.1.1"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "IBM/KMS"
  })
}

control "cis_v100_8_1_2" {
  title         = "8.1.2 Ensure the IBM Key Protect service has high availability"
  documentation = file("./cis_v100/docs/cis_v100_6_2_1.md")
  sql           = query.manual_control.sql

  tags = merge(local.cis_v100_8_1_common_tags, {
    cis_item_id = "8.1.2"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "IBM/KMS"
  })
}
