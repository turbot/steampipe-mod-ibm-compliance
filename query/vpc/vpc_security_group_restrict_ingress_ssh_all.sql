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
  -- Required Columns
  sg.crn as resource,
  case
    when r.crn is null then 'ok'
    else 'alarm'
  end as status,
  case
    when r.crn is null then sg.title || ' ingress restricted for port 22 from 0.0.0.0/0.'
    else  sg.title || ' contains ' || r.num_ssh_rules || ' ingress rule(s) allowing port 22 from 0.0.0.0/0.'
  end as reason,
  -- Additional Dimensions
  sg.region,
  sg.account_id
from
  ibm_is_security_group as sg
  left join ingress_ssh_rules as r on r.crn = sg.crn;