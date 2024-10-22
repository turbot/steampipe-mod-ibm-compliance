query "vpc_network_acl_restrict_ingress_rdp_all" {
  sql = <<-EOQ
    with ingress_rdp_rules as (
      select
        crn,
        count(id) as num_rdp_rules
      from
        ibm_is_network_acl,
        jsonb_array_elements(rules) as rule
      where
        rule ->> 'direction' = 'inbound'
        and rule ->> 'source' = '0.0.0.0/0'
        and rule ->> 'action' = 'allow'
        and (
          rule ->> 'protocol' = 'all'
          or (
            (rule ->> 'source_port_min') :: integer <= 3389
            and (rule ->> 'source_port_max') :: integer >= 3389
          )
        )
      group by crn
    )
    select
      acl.crn as resource,
      case
        when r.crn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when r.crn is null then acl.title || ' ingress restricted for RDP from 0.0.0.0/0.'
        else acl.title || ' contains ' || r.num_rdp_rules || ' ingress rule(s) allowing RDP from 0.0.0.0/0.'
      end as reason,
      acl.region,
      acl.account_id
    from
      ibm_is_network_acl as acl
      left join ingress_rdp_rules as r on r.crn = acl.crn;
  EOQ
}

query "vpc_network_acl_restrict_ingress_ssh_all" {
  sql = <<-EOQ
    with ingress_ssh_rules as (
      select
        crn,
        count(id) as num_ssh_rules
      from
        ibm_is_network_acl,
        jsonb_array_elements(rules) as rule
      where
        rule ->> 'direction' = 'inbound'
        and rule ->> 'source' = '0.0.0.0/0'
        and rule ->> 'action' = 'allow'
        and (
          rule ->> 'protocol' = 'all'
          or (
            (rule ->> 'source_port_min') :: integer <= 22
            and (rule ->> 'source_port_max') :: integer >= 22
          )
        )
      group by crn
    )
    select
      acl.crn as resource,
      case
        when r.crn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when r.crn is null then acl.title || ' ingress restricted for SSH from 0.0.0.0/0.'
        else acl.title || ' contains ' || r.num_ssh_rules || ' ingress rule(s) allowing SSH from 0.0.0.0/0.'
      end as reason,
      acl.region,
      acl.account_id
    from
      ibm_is_network_acl as acl
      left join ingress_ssh_rules as r on r.crn = acl.crn;
  EOQ
}

query "vpc_security_group_restrict_ingress_rdp_all" {
  sql = <<-EOQ
    with ingress_rdp_rules as (
      select
        crn,
        count(id) as num_rdp_rules
      from
        ibm_is_security_group,
        jsonb_array_elements(rules) as rule
      where
        rule ->> 'direction' = 'inbound'
        and rule -> 'remote' ->> 'cidr_block' = '0.0.0.0/0'
        and (
          rule ->> 'protocol' = 'all'
          or (
            (rule ->> 'port_min') :: integer <= 3389
            and (rule ->> 'port_max') :: integer >= 3389
          )
        )
      group by crn
    )
    select
      sg.crn as resource,
      case
        when r.crn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when r.crn is null then sg.title || ' ingress restricted for RDP from 0.0.0.0/0.'
        else sg.title || ' contains ' || r.num_rdp_rules || ' ingress rule(s) allowing RDP from 0.0.0.0/0.'
      end as reason,
      sg.region,
      sg.account_id
    from
      ibm_is_security_group as sg
      left join ingress_rdp_rules as r on r.crn = sg.crn;
  EOQ
}

query "vpc_security_group_restrict_ingress_ssh_all" {
  sql = <<-EOQ
    with ingress_ssh_rules as (
      select
        crn,
        count(id) as num_ssh_rules
      from
        ibm_is_security_group,
        jsonb_array_elements(rules) as rule
      where
        rule ->> 'direction' = 'inbound'
        and rule -> 'remote' ->> 'cidr_block' = '0.0.0.0/0'
        and (
          rule ->> 'protocol' = 'all'
          or (
            (rule ->> 'port_min') :: integer <= 22
            and (rule ->> 'port_max') :: integer >= 22
          )
        )
      group by crn
    )
    select
      sg.crn as resource,
      case
        when r.crn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when r.crn is null then sg.title || ' ingress restricted for port 22 from 0.0.0.0/0.'
        else sg.title || ' contains ' || r.num_ssh_rules || ' ingress rule(s) allowing port 22 from 0.0.0.0/0.'
      end as reason,
      sg.region,
      sg.account_id
    from
      ibm_is_security_group as sg
      left join ingress_ssh_rules as r on r.crn = sg.crn;
  EOQ
}