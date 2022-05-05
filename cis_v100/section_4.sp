locals {
  cis_v100_4_common_tags = merge(local.cis_v100_common_tags, {
    cis_section_id = "4"
  })
}

benchmark "cis_v100_4" {
  title         = "4 IBM Cloud Databases Family"
  documentation = file("./cis_v100/docs/cis_v100_4.md")
  children = [
    control.cis_v100_4_1,
    control.cis_v100_4_2,
    control.cis_v100_4_3,
    control.cis_v100_4_4
  ]

  tags = merge(local.cis_v100_4_common_tags, {
    service = "IBM/Database"
    type    = "Benchmark"
  })
}

control "cis_v100_4_1" {
  title         = "4.1 Ensure IBM Cloud Databases disk encryption is enabled with customer  managed keys"
  documentation = file("./cis_v100/docs/cis_v100_3_1.md")
  sql           = query.manual_control.sql

  tags = merge(local.cis_v100_4_common_tags, {
    cis_item_id = "4.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/Database"
  })
}

control "cis_v100_4_2" {
  title         = "4.2 Ensure IBM Cloud Databases are only accessible via HTTPS or TLS  Connections"
  documentation = file("./cis_v100/docs/cis_v100_4_2.md")
  sql           = query.manual_control.sql

  tags = merge(local.cis_v100_4_common_tags, {
    cis_item_id = "4.2"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "IBM/Database"
  })
}

control "cis_v100_4_3" {
  title         = "4.3 Ensure network access to IBM Cloud Databases service is set to be exposed on  “Private end points only"
  documentation = file("./cis_v100/docs/cis_v100_4_3.md")
  sql           = query.manual_control.sql

  tags = merge(local.cis_v100_4_common_tags, {
    cis_item_id = "4.3"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "IBM/Database"
  })
}

control "cis_v100_4_4" {
  title         = "4.4 Ensure IBM Cloud Databases disk encryption is set to On"
  documentation = file("./cis_v100/docs/cis_v100_4_4.md")
  sql           = query.manual_control.sql

  tags = merge(local.cis_v100_4_common_tags, {
    cis_item_id = "4.4"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "IBM/Database"
  })
}
