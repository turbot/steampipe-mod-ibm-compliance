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
  -- Required Columns
  acl.crn as resource,
  case
    when r.crn is null then 'ok'
    else 'alarm'
  end as status,
  case
    when r.crn is null then acl.title || ' ingress restricted for SSH from 0.0.0.0/0.'
    else acl.title || ' contains ' || r.num_ssh_rules || ' ingress rule(s) allowing SSH from 0.0.0.0/0.'
  end as reason,
  -- Additional Dimensions
  acl.region,
  acl.account_id
from
  ibm_is_network_acl as acl
  left join ingress_ssh_rules as r on r.crn = acl.crn;