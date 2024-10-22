## v1.0.0 [2024-10-22]

This mod now requires [Powerpipe](https://powerpipe.io). [Steampipe](https://steampipe.io) users should check the [migration guide](https://powerpipe.io/blog/migrating-from-steampipe).

## v0.8 [2024-03-06]

_Powerpipe_

[Powerpipe](https://powerpipe.io) is now the preferred way to run this mod!  [Migrating from Steampipe →](https://powerpipe.io/blog/migrating-from-steampipe)

All v0.x versions of this mod will work in both Steampipe and Powerpipe, but v1.0.0 onwards will be in Powerpipe format only.

_Enhancements_

- Focus documentation on Powerpipe commands.
- Show how to combine Powerpipe mods with Steampipe plugins.

## v0.7 [2024-01-09]

_Enhancements_

- Updated the controls to reference their query using `query =` rather than `sql =`. ([#25](https://github.com/turbot/steampipe-mod-ibm-compliance/pull/25))

## v0.6 [2022-05-17]

_Bug fixes_

- Updated "IBM Cloud" references in README, index doc, and mod.sp. ([#20](https://github.com/turbot/steampipe-mod-ibm-compliance/pull/20))

## v0.5 [2022-05-09]

_Enhancements_

- Updated docs/index.md and README with new dashboard screenshots and latest format. ([#17](https://github.com/turbot/steampipe-mod-ibm-compliance/pull/17))

## v0.4 [2022-05-05]

_Enhancements_

- Added `category`, `service`, and `type` tags to benchmarks and controls. ([#13](https://github.com/turbot/steampipe-mod-ibm-compliance/pull/13))

## v0.3 [2021-11-12]

_Bug fixes_

- Fixed brand colour to match IBM's

## v0.2 [2021-10-29]

_What's new?_

- Added: CIS v1.0.0 benchmark now includes `cis_v100_1_6` and `cis_v100_6_2_2` controls

_Bug fixes_

- Fixed the CIS controls which had the incorrect `cis_type` tag

## v0.1 [2021-10-28]

_What's new?_

- Added: CIS v1.0.0 benchmark (`steampipe check ibm_compliance.benchmark.cis_v100`)
