select
  -- Required Columns
  id as resource,
  case
    when minimum_tls_version in ('1.2','1.3') then 'ok'
    else 'alarm'
  end as status,
  name || ' is with TLS version ' || minimum_tls_version as reason,
  -- Additional Dimensions
  account_id
  from
    ibm_cis_domain;