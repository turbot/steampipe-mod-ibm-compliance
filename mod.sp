// Benchmarks and controls for specific services should override the "service" tag
locals {
  ibm_compliance_common_tags = {
    category = "Compliance"
    plugin   = "ibm"
    service  = "IBM"
  }
}

mod "ibm_compliance" {
  # hub metadata
  title         = "IBM Cloud Compliance"
  description   = "Run individual configuration, compliance and security controls or full compliance benchmarks for CIS across all your IBM Cloud accounts using Steampipe."
  color         = "#0F62FE"
  documentation = file("./docs/index.md")
  icon          = "/images/mods/turbot/ibm-compliance.svg"
  categories    = ["IBM", "CIS", "Compliance", "Public Cloud", "Security"]

  opengraph {
    title       = "Steampipe Mod for IBM Cloud Compliance"
    description = "Run individual configuration, compliance and security controls or full compliance benchmarks for CIS across all your IBM Cloud accounts using Steampipe."
    image       = "/images/mods/turbot/ibm-compliance-social-graphic.png"
  }
}
