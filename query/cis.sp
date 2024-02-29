query "internet_service_ddos_protection_active" {
  sql = <<-EOQ
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
      p.id as resource,
      case
        when p.id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when p.id is null then p.name || ' DDoS protection is inactive on Cloud Internet Services.'
        else p.name || ' DDoS protection is active on Cloud Internet Services.'
      end as reason,
      acc.guid as account_id
    from
        proxy_enabled as p,
        ibm_account as acc;
  EOQ
}

query "internet_service_tls_higher_version_enabled" {
  sql = <<-EOQ
    select
      id as resource,
      case
        when minimum_tls_version in ('1.2','1.3') then 'ok'
        else 'alarm'
      end as status,
      name || ' is with TLS version ' || minimum_tls_version as reason,
      account_id
    from
      ibm_cis_domain;
  EOQ
}

query "internet_service_waf_enabled" {
  sql = <<-EOQ
    select
      id as resource,
      case
        when web_application_firewall != 'off' then 'ok'
        else 'alarm'
      end as status,
      cis.name || ' Web Application Firewall setting is ' || web_application_firewall || '.' as reason,
      acc.guid as account_id
    from
      ibm_cis_domain as cis,
      ibm_account as acc;
  EOQ
}