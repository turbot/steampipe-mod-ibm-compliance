select
  -- Required Columns
  id as resource,
  case
    when web_application_firewall != 'off' then 'ok'
    else 'alarm'
  end as status,
  cis.name || ' Web Application Firewall setting is ' || web_application_firewall as reason,
  -- Additional Dimensions
  acc.guid as account_id
  from
    ibm_cis_domain as cis,
    ibm_account as acc;