query "manual_control" {
  sql = <<-EOQ
    select
      guid as resource,
      'info' as status,
      'Manual verification required.' as reason,
      guid
    from
      ibm_account;
  EOQ
}