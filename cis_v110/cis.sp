locals {
  cis_v110_common_tags = merge(local.ibm_compliance_common_tags, {
    cis         = "true"
    cis_version = "v1.1.0"
  })
}

benchmark "cis_v110" {
  title         = "CIS v1.1.0"
  description   = "The CIS Microsoft IBM Foundations Security Benchmark provides prescriptive guidance for establishing a secure baseline configuration for IBM Cloud."
  documentation = file("./cis_v110/docs/cis_overview.md")
  children = [
    benchmark.cis_v110_1,
    benchmark.cis_v110_2,
    benchmark.cis_v110_3,
    benchmark.cis_v110_4,
    benchmark.cis_v110_5,
    benchmark.cis_v110_6,
    benchmark.cis_v110_7,
    benchmark.cis_v110_8,
    benchmark.cis_v110_9,
    benchmark.cis_v110_10
  ]

  tags = merge(local.cis_v110_common_tags, {
    type = "Benchmark"
  })
}
