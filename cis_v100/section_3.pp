locals {
  cis_v100_3_common_tags = merge(local.cis_v100_common_tags, {
    cis_section_id = "3"
  })
}

benchmark "cis_v100_3" {
  title         = "3 Maintenance, Monitoring and Analysis of Audit Logs"
  documentation = file("./cis_v100/docs/cis_v100_3.md")
  children = [
    control.cis_v100_3_1,
    control.cis_v100_3_2,
    control.cis_v100_3_3,
    control.cis_v100_3_4,
    control.cis_v100_3_5,
    control.cis_v100_3_6,
    control.cis_v100_3_7,
  ]

  tags = merge(local.cis_v100_3_common_tags, {
    service = "IBM/Monitoring"
    type    = "Benchmark"
  })
}

control "cis_v100_3_1" {
  title         = "3.1 Ensure auditing is configured in the IBM Cloud account"
  description   = "Collect audit events from IBM Cloud resources so that you can monitor activity in your IBM Cloud account."
  documentation = file("./cis_v100/docs/cis_v100_3_1.md")
  query         = query.manual_control

  tags = merge(local.cis_v100_3_common_tags, {
    cis_item_id = "3.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/Monitoring"
  })
}

control "cis_v100_3_2" {
  title         = "3.2 Ensure that archiving is enabled for audit events"
  description   = "Archive events for long-term storage so that you have access to data for a longer period of time, you can comply with highly regulated environments, you can recover quickly in the eventuality of a disaster scenario, and you can adhere to internal data storage policies"
  documentation = file("./cis_v100/docs/cis_v100_3_2.md")
  query         = query.manual_control

  tags = merge(local.cis_v100_3_common_tags, {
    cis_item_id = "3.2"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "IBM/Monitoring"
  })
}

control "cis_v100_3_3" {
  title         = "3.3 Ensure that events are collected and processed to identify anomalies or abnormal events"
  description   = "Events that you collect and centralize in the IBM Cloud Activity Tracker with LogDNA service provide information about actions that take place on your account. You can analyze this data to resolve problems, identify anomalies, and be notified of abnormal situations."
  documentation = file("./cis_v100/docs/cis_v100_3_3.md")
  query         = query.manual_control

  tags = merge(local.cis_v100_3_common_tags, {
    cis_item_id = "3.3"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "IBM/Monitoring"
  })
}

control "cis_v100_3_4" {
  title         = "3.4 Ensure alerts are defined on custom views to notify of unauthorized requests, critical account actions, and high-impact operations in your account"
  description   = "Events that you collect and centralize in the IBM Cloud Activity Tracker with LogDNA service provide information about actions that take place on your account. You can define alerts to notify promptly of problems, anomalies, and abnormal situations."
  documentation = file("./cis_v100/docs/cis_v100_3_4.md")
  query         = query.manual_control

  tags = merge(local.cis_v100_3_common_tags, {
    cis_item_id = "3.4"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "IBM/Monitoring"
  })
}

control "cis_v100_3_5" {
  title         = "3.5 Ensure the account owner can login only from a list of authorized countries/IP ranges"
  description   = "Monitor the account owner's access to the IBM Cloud account is done from authorized locations that are restricted by IP addresses."
  documentation = file("./cis_v100/docs/cis_v100_3_5.md")
  query         = query.manual_control

  tags = merge(local.cis_v100_3_common_tags, {
    cis_item_id = "3.5"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "IBM/Monitoring"
  })
}

control "cis_v100_3_6" {
  title         = "3.6 Ensure Activity Tracker data is encrypted at rest"
  description   = "Ensure Activity Tracker data is encrypted at rest."
  documentation = file("./cis_v100/docs/cis_v100_3_6.md")
  query         = query.manual_control

  tags = merge(local.cis_v100_3_common_tags, {
    cis_item_id = "3.6"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "IBM/Monitoring"
  })
}

control "cis_v100_3_7" {
  title         = "3.7 Ensure Activity Tracker trails are integrated with LogDNA Logs"
  description   = "Check whether Activity Tracker trails are integrated with LogDNA Logs."
  documentation = file("./cis_v100/docs/cis_v100_3_7.md")
  query         = query.manual_control

  tags = merge(local.cis_v100_3_common_tags, {
    cis_item_id = "3.7"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "IBM/Monitoring"
  })
}
