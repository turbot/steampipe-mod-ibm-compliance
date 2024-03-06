query "object_storage_bucket_with_cmk" {
  sql = <<-EOQ
    select
      title as resource,
      case
        when sse_kp_customer_root_key_crn != '<null>' then 'ok'
        else 'alarm'
      end as status,
      case
        when sse_kp_customer_root_key_crn != '<null>' then title || ' configured with CMK.'
        else title || ' not configured with CMK.'
      end as reason,
      region,
      acc.guid as account_id
    from
      ibm_cos_bucket,
      ibm_account as acc;
  EOQ
}

query "object_storage_bucket_with_key_protect_enabled" {
  sql = <<-EOQ
    select
      title as resource,
      case
        when sse_kp_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when sse_kp_enabled then title || ' associated with Key Protect key management service.'
        else title || ' not associated with Key Protect key management service.'
      end as reason,
      region,
      acc.guid as account_id
    from
      ibm_cos_bucket,
      ibm_account as acc;
  EOQ
}
