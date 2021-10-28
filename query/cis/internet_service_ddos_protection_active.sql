with proxy_enabled as(
  select
    rule ->> 'proxied' as proxy,
    name,
    id
  from
    ibm_cis_domain,
    jsonb_array_elements(global_load_balancer) as rule
    where rule ->> 'proxied' = 'true'
)
select
  -- Required Columns
  p.id as resource,
  case
    when p.id is null then 'alarm'
    else 'ok'
  end as status,
  case
    when p.id is null then p.name || ' DDoS protection is inactive on Cloud Internet Services.'
    else p.name || ' DDoS protection is active on Cloud Internet Services.'
  end as reason,
  -- Additional Dimensions
  acc.guid as account_id
  from
    proxy_enabled as p,
    ibm_account as acc;