locals {
  cis_v100_common_tags = {
    benchmark   = "cis"
    cis_version = "v1.0.0"
    plugin      = "ibm"
  }
}

benchmark "cis_v100" {
  title         = "CIS v1.0.0"
  description   = "The CIS Microsoft IBM Foundations Security Benchmark provides prescriptive guidance for establishing a secure baseline configuration for IBM Cloud."
  #documentation = file("./cis_v100/docs/cis_overview.md")
  tags          = local.cis_v100_common_tags
  children = [
    benchmark.cis_v100_6
  ]
}
