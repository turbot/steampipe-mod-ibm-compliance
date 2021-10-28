mod "ibm_compliance" {
  # hub metadata
  title         = "IBM Compliance"
  description   = "Run individual configuration, compliance and security controls or full compliance benchmarks for CIS across all your IBM accounts using Steampipe."
  color         = "#00b050"
  documentation = file("./docs/index.md")
  icon          = "/images/mods/turbot/ibm-compliance.svg"
  categories    = ["IBM", "CIS", "Compliance", "Public Cloud", "Security"]

  opengraph {
    title       = "Steampipe Mod for IBM Compliance"
    description = "Run individual configuration, compliance and security controls or full compliance benchmarks for CIS across all your IBM accounts using Steampipe."
    image       = "/images/mods/turbot/ibm-compliance-social-graphic.png"
  }
}
