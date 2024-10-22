locals {
  cis_v100_common_tags = merge(local.ibm_compliance_common_tags, {
    cis         = "true"
    cis_version = "v1.0.0"
  })
}

benchmark "cis_v100" {
  title         = "CIS v1.0.0"
  description   = "The CIS Microsoft IBM Foundations Security Benchmark provides prescriptive guidance for establishing a secure baseline configuration for IBM Cloud."
  documentation = file("./cis_v100/docs/cis_overview.md")
  children = [
    benchmark.cis_v100_1,
    benchmark.cis_v100_2,
    benchmark.cis_v100_3,
    benchmark.cis_v100_4,
    benchmark.cis_v100_5,
    benchmark.cis_v100_6,
    benchmark.cis_v100_7,
    benchmark.cis_v100_8,
    benchmark.cis_v100_9,
    benchmark.cis_v100_10
  ]

  tags = merge(local.cis_v100_common_tags, {
    type = "Benchmark"
  })
}
