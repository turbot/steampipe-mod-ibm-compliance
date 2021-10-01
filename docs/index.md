---
repository: "https://github.com/turbot/steampipe-mod-ibm-compliance"
---

# IBM Compliance Mod

Run individual configuration, compliance and security controls or full `CIS` compliance benchmarks across all your IBM accounts.

## References

[IBM Cloud](https://www.ibm.com/cloud) is a set of cloud computing services for business including IaaS and PaaS.

[CIS IBM Benchmarks](https://www.cisecurity.org/benchmark/ibm/) provide a predefined set of compliance and security best-practice checks for IBM Cloud usage.

[Steampipe](https://steampipe.io) is an open source CLI to instantly query cloud APIs using SQL.

[Steampipe Mods](https://steampipe.io/docs/steampipe-mods/) are collections of `named queries`, and codified `controls` that can be used to test current configuration of your cloud resources against a desired configuration.

## Documentation

- **[Benchmarks and controls →](https://hub.steampipe.io/mods/turbot/ibm_compliance/controls)**
- **[Named queries →](https://hub.steampipe.io/mods/turbot/ibm_compliance/queries)**

## Get started

Install the IBM plugin with [Steampipe](https://steampipe.io):

```shell
steampipe plugin install ibm
```

Clone:

```sh
git clone https://github.com/turbot/steampipe-mod-ibm-compliance.git
cd steampipe-mod-ibm-compliance
```

Run all benchmarks:

```shell
steampipe check all
```

Run a benchmark:

```shell
steampipe check benchmark.cis_v100
```

Run a specific control:

```shell
steampipe check control.cis_v100_6_2_1
```

### Credentials

This mod uses the credentials configured in the [Steampipe IBM plugin](https://hub.steampipe.io/plugins/turbot/ibm).

### Configuration

No extra configuration is required.

## Get involved

- Contribute: [GitHub Repo](https://github.com/turbot/steampipe-mod-ibm-compliance)
- Community: [Slack Channel](https://join.slack.com/t/steampipe/shared_invite/zt-oij778tv-lYyRTWOTMQYBVAbtPSWs3g)
