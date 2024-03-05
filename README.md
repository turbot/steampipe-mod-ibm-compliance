# IBM Cloud Compliance Mod for Powerpipe

> [!IMPORTANT]  
> Steampipe mods are [migrating to Powerpipe format](https://powerpipe.io) to gain new features. This mod currently works with both Steampipe and Powerpipe, but will only support Powerpipe from v1.x onward.

60+ checks covering industry defined security best practices across all IBM Cloud regions. Includes support for v1.0.0 CIS benchmarks.

Run checks in a dashboard:
<!-- ![image](https://raw.githubusercontent.com/turbot/steampipe-mod-ibm-compliance/main/docs/ibm_compliance_dashboard.png) -->
![image](https://raw.githubusercontent.com/turbot/steampipe-mod-ibm-compliance/add-new-checks/docs/ibm_compliance_dashboard.png)

Or in a terminal:
<!-- ![image](https://raw.githubusercontent.com/turbot/steampipe-mod-ibm-compliance/main/docs/ibm_compliance_terminal.png) -->
![image](https://raw.githubusercontent.com/turbot/steampipe-mod-ibm-compliance/add-new-checks/docs/ibm_compliance_terminal.png)

Includes support for:
* [IBM Cloud CIS v1.0.0](https://hub.steampipe.io/mods/turbot/ibm_compliance/controls/benchmark.cis_v100)

## Documentation

- **[Benchmarks and controls →](https://hub.powerpipe.io/mods/turbot/ibm_compliance/controls)**
- **[Named queries →](https://hub.powerpipe.io/mods/turbot/ibm_compliance/queries)**

## Getting Started

### Installation

Install Powerpipe (https://powerpipe.io/downloads), or use Brew:

```sh
brew install turbot/tap/powerpipe
```

This mod also requires [Steampipe](https://steampipe.io) with the [IBM Cloud plugin](https://hub.steampipe.io/plugins/turbot/ibm) as the data source. Install Steampipe (https://steampipe.io/downloads), or use Brew:

```sh
brew install turbot/tap/steampipe
steampipe plugin install ibm
```

Finally, install the mod:

```sh
mkdir dashboards
cd dashboards
powerpipe mod init
powerpipe mod install github.com/turbot/steampipe-mod-ibm-compliance
```

### Browsing Dashboards

Start Steampipe as the data source:

```sh
steampipe service start
```

Start the dashboard server:

```sh
powerpipe server
```

Browse and view your dashboards at **https://localhost:9033**.

### Running Checks in Your Terminal

Instead of running benchmarks in a dashboard, you can also run them within your
terminal with the `powerpipe benchmark` command:

List available benchmarks:

```sh
powerpipe benchmark list
```

Run a benchmark:

```sh
powerpipe benchmark run steampipe check benchmark.cis_v100
```

Different output formats are also available, for more information please see
[Output Formats](https://powerpipe.io/docs/reference/cli/benchmark#output-formats).

## Open Source & Contributing

This repository is published under the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0). Please see our [code of conduct](https://github.com/turbot/.github/blob/main/CODE_OF_CONDUCT.md). We look forward to collaborating with you!

[Steampipe](https://steampipe.io) and [Powerpipe](https://powerpipe.io) are products produced from this open source software, exclusively by [Turbot HQ, Inc](https://turbot.com). They are distributed under our commercial terms. Others are allowed to make their own distribution of the software, but cannot use any of the Turbot trademarks, cloud services, etc. You can learn more in our [Open Source FAQ](https://turbot.com/open-source).

## Get Involved

**[Join #powerpipe on Slack →](https://turbot.com/community/join)**

Want to help but don't know where to start? Pick up one of the `help wanted` issues:

- [Powerpipe](https://github.com/turbot/powerpipe/labels/help%20wanted)
- [IBM Compliance Mod](https://github.com/turbot/steampipe-mod-ibm-compliance/labels/help%20wanted)
