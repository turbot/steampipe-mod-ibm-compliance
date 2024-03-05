mod "ibm_compliance" {
  # Hub metadata
  title         = "IBM Cloud Compliance"
  description   = "Run individual configuration, compliance and security controls or full compliance benchmarks for CIS across all your IBM Cloud accounts using Powerpipe and Steampipe."
  color         = "#0F62FE"
  documentation = file("./docs/index.md")
  icon          = "/images/mods/turbot/ibm-compliance.svg"
  categories    = ["IBM", "CIS", "Compliance", "Public Cloud", "Security"]

  opengraph {
    title       = "Powerpipe Mod for IBM Cloud Compliance"
    description = "Run individual configuration, compliance and security controls or full compliance benchmarks for CIS across all your IBM Cloud accounts using Powerpipe and Steampipe."
    image       = "/images/mods/turbot/ibm-compliance-social-graphic.png"
  }
}
