// Benchmarks and controls for specific services should override the "service" tag
locals {
  ibm_compliance_common_tags = {
    category = "Compliance"
    plugin   = "ibm"
    service  = "IBM"
  }
}
