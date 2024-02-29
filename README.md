# IBM Cloud Compliance Mod for Steampipe

60+ checks covering industry defined security best practices across all IBM Cloud regions. Includes support for v1.0.0 CIS benchmarks.

Run checks in a dashboard:
![image](https://raw.githubusercontent.com/turbot/steampipe-mod-ibm-compliance/main/docs/ibm_compliance_dashboard.png)

Or in a terminal:
![image](https://raw.githubusercontent.com/turbot/steampipe-mod-ibm-compliance/main/docs/ibm_compliance_terminal.png)

Includes support for:
* [IBM Cloud CIS v1.0.0](https://hub.steampipe.io/mods/turbot/ibm_compliance/controls/benchmark.cis_v100)

## Documentation

- **[Benchmarks and controls →](https://hub.steampipe.io/mods/turbot/ibm_compliance/controls)**
- **[Named queries →](https://hub.steampipe.io/mods/turbot/ibm_compliance/queries)**

## Getting Started

### Installation

Download and install Steampipe (https://steampipe.io/downloads). Or use Brew:

```sh
brew tap turbot/tap
brew install steampipe
```

Download and install Steampipe (https://steampipe.io/downloads). Or use Brew:

```sh
brew tap turbot/tap
brew install steampipe
```

Install the IBM Cloud plugin with [Steampipe](https://steampipe.io):

```sh
steampipe plugin install ibm
```

Clone:

```sh
git clone https://github.com/turbot/steampipe-mod-ibm-compliance.git
cd steampipe-mod-ibm-compliance
```

### Usage

Start your dashboard server to get started:

```sh
steampipe dashboard
```

By default, the dashboard interface will then be launched in a new browser
window at http://localhost:9194. From here, you can run benchmarks by
selecting one or searching for a specific one.

Instead of running benchmarks in a dashboard, you can also run them within your
terminal with the `steampipe check` command:

Run all benchmarks:

```sh
steampipe check all
```

Run a single benchmark:

```sh
steampipe check benchmark.cis_v100
```

Run a specific control:

```sh
steampipe check control.cis_v100_6_2_1
```

Different output formats are also available, for more information please see
[Output Formats](https://steampipe.io/docs/reference/cli/check#output-formats).

### Credentials

This mod uses the credentials configured in the [Steampipe IBM Cloud plugin](https://hub.steampipe.io/plugins/turbot/ibm).

### Configuration

No extra configuration is required.

## Open Source & Contributing

This repository is published under the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0). Please see our [code of conduct](https://github.com/turbot/.github/blob/main/CODE_OF_CONDUCT.md). We look forward to collaborating with you!

[Steampipe](https://steampipe.io) is a product produced from this open source software, exclusively by [Turbot HQ, Inc](https://turbot.com). It is distributed under our commercial terms. Others are allowed to make their own distribution of the software, but cannot use any of the Turbot trademarks, cloud services, etc. You can learn more in our [Open Source FAQ](https://turbot.com/open-source).

## Get Involved

**[Join #steampipe on Slack →](https://turbot.com/community/join)**

Want to help but don't know where to start? Pick up one of the `help wanted` issues:

- [Steampipe](https://github.com/turbot/steampipe/labels/help%20wanted)
- [AWS Compliance Mod](https://github.com/turbot/steampipe-mod-aws-compliance/labels/help%20wanted)