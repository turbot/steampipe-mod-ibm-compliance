---
repository: "https://github.com/turbot/steampipe-mod-ibm-compliance"
---

# IBM Cloud Compliance Mod

Run individual configuration, compliance and security controls or full `CIS` compliance benchmarks across all your IBM Cloud accounts.

<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-ibm-compliance/main/docs/ibm_compliance_dashboard.png" width="50%" type="thumbnail"/>
<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-ibm-compliance/main/docs/ibm_cis_v100_dashboard.png" width="50%" type="thumbnail"/>
<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-ibm-compliance/main/docs/ibm_compliance_terminal.png" width="50%" type="thumbnail"/>

## References

[IBM Cloud](https://www.ibm.com/cloud) is a set of cloud computing services for business including IaaS and PaaS.

[CIS IBM Benchmarks](https://www.cisecurity.org/benchmark/ibm/) provide a predefined set of compliance and security best-practice checks for IBM Cloud usage.

[Steampipe](https://steampipe.io) is an open source CLI to instantly query cloud APIs using SQL.

[Steampipe Mods](https://steampipe.io/docs/steampipe-mods/) are collections of `named queries`, and codified `controls` that can be used to test current configuration of your cloud resources against a desired configuration.

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