locals {
  cis_v100_2_common_tags = merge(local.cis_v100_common_tags, {
    cis_section_id = "2"
  })
}

locals {
  cis_v100_2_1_common_tags = merge(local.cis_v100_2_common_tags, {
    cis_section_id = "2.1"
  })
  cis_v100_2_2_common_tags = merge(local.cis_v100_2_common_tags, {
    cis_section_id = "2.2"
  })
}

locals {
  cis_v100_2_1_1_common_tags = merge(local.cis_v100_2_1_common_tags, {
    cis_section_id = "2.1.1"
  })
  cis_v100_2_2_1_common_tags = merge(local.cis_v100_2_2_common_tags, {
    cis_section_id = "2.2.1"
  })
}

benchmark "cis_v100_2" {
  title         = "2 Storage"
  documentation = file("./cis_v100/docs/cis_v100_2.md")
  children = [
    benchmark.cis_v100_2_1,
    benchmark.cis_v100_2_2,
  ]

  tags = merge(local.cis_v100_2_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_v100_2_1" {
  title       = "2.1 Cloud Object Storage"
  description = "Cloud Object Storage stores encrypted and dispersed data across multiple geographic locations. Information stored with IBM Cloud Object Storage is encrypted and dispersed across multiple geographic locations, and accessed over popular protocols like HTTPS using a modern RESTful API."
  children = [
    benchmark.cis_v100_2_1_1,
    control.cis_v100_2_1_2,
    control.cis_v100_2_1_3,
    control.cis_v100_2_1_4,
    control.cis_v100_2_1_5,
  ]

  tags = merge(local.cis_v100_2_1_common_tags, {
    service = "IBM/Storage"
    type    = "Benchmark"
  })
}

benchmark "cis_v100_2_1_1" {
  title       = "2.1.1 Cloud Object Storage Encryption"
  description = "Objects stored in IBM Cloud Object Storage need to be encrypted at all times for client data security. By default all objects stored in IBM Cloud Object Storage are encrypted at-rest using provider-managed keys and no user action is needed. Optionally, you can also leverage IBM Cloud Object Storage integration with IBM Cloud Key Management Services to further add another layer of encryption to the Data Encryption Keys (DEKs) associated with the data (objects) stored in Cloud Object Storage buckets."
  children = [
    control.cis_v100_2_1_1_1,
    control.cis_v100_2_1_1_2,
    control.cis_v100_2_1_1_3,
  ]

  tags = merge(local.cis_v100_2_2_1_common_tags, {
    service = "IBM/Storage"
    type    = "Benchmark"
  })
}

control "cis_v100_2_1_1_1" {
  title         = "2.1.1.1 Ensure Cloud Object Storage encryption is done with customer managed  keys"
  description   = "Users can store objects in IBM Cloud Object Storage buckets by providing their own encryption keys which get applied at a per object level."
  documentation = file("./cis_v100/docs/cis_v100_2_1_1_1.md")
  query         = query.object_storage_bucket_with_cmk

  tags = merge(local.cis_v100_2_1_1_common_tags, {
    cis_item_id = "2.1.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/Storage"
  })
}

control "cis_v100_2_1_1_2" {
  title         = "2.1.1.2 Ensure Cloud Object Storage Encryption is set to On with BYOK"
  description   = "You can use IBM Cloud encryption key management service, for example Key Protect, to bring your own root key (BYOK) to IBM Cloud and use it to add envelope encryption for data that is stored in IBM Cloud Object Storage buckets."
  documentation = file("./cis_v100/docs/cis_v100_2_1_1_2.md")
  query         = query.object_storage_bucket_with_key_protect_enabled

  tags = merge(local.cis_v100_2_1_1_common_tags, {
    cis_item_id = "2.1.1.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/Storage"
  })
}

control "cis_v100_2_1_1_3" {
  title         = "2.1.1.3 Ensure Cloud Object Storage Encryption is set to On with KYOK"
  description   = "You can use IBM Cloud encryption key management services, for example, Hyper Protect Crypto Services to keep and manage exclusive control over the root keys used to add envelop encryption for data that is stored in IBM Cloud Object Storage buckets."
  documentation = file("./cis_v100/docs/cis_v100_2_1_1_3.md")
  query         = query.object_storage_bucket_with_key_protect_enabled

  tags = merge(local.cis_v100_2_1_1_common_tags, {
    cis_item_id = "2.1.1.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/Storage"
  })
}

control "cis_v100_2_1_2" {
  title         = "2.1.2 Ensure network access for Cloud Object Storage is restricted to specific IP  range"
  description   = ""
  documentation = file("./cis_v100/docs/cis_v100_2_1_2.md")
  query         = query.manual_control

  tags = merge(local.cis_v100_2_1_common_tags, {
    cis_item_id = "2.1.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/Storage"
  })
}

control "cis_v100_2_1_3" {
  title         = "2.1.3 Ensure network access for Cloud Object Storage is set to be exposed only on  Private end-points"
  description   = ""
  documentation = file("./cis_v100/docs/cis_v100_2_1_3.md")
  query         = query.manual_control

  tags = merge(local.cis_v100_2_1_common_tags, {
    cis_item_id = "2.1.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/Storage"
  })
}

control "cis_v100_2_1_4" {
  title         = "2.1.4 Ensure Cloud Object Storage bucket access is restricted by using IAM and S3  access control"
  documentation = file("./cis_v100/docs/cis_v100_2_1_4.md")
  query         = query.manual_control

  tags = merge(local.cis_v100_2_1_common_tags, {
    cis_item_id = "2.1.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/Storage"
  })
}

control "cis_v100_2_1_5" {
  title         = "2.1.5 Disable public (anonymous) access to IBM Cloud Object Storage buckets"
  documentation = file("./cis_v100/docs/cis_v100_2_1_5.md")
  query         = query.iam_access_group_with_public_access

  tags = merge(local.cis_v100_2_1_common_tags, {
    cis_item_id = "2.1.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/Storage"
  })
}

benchmark "cis_v100_2_2" {
  title       = "2.2  File Block Storage"
  description = "IBM Cloud Block Storage is persistent, high-performance iSCSI storage that is provisioned and managed independently of compute instances. iSCSI-based Block Storage LUNs are connected to authorized devices through redundant multi-path I/O (MPIO) connections."
  children = [
    benchmark.cis_v100_2_2_1,
    control.cis_v100_2_2_2,
    control.cis_v100_2_2_3,
    control.cis_v100_2_2_4,
  ]

  tags = merge(local.cis_v100_2_2_common_tags, {
    service = "IBM/BlockStorage"
    type    = "Benchmark"
  })
}

benchmark "cis_v100_2_2_1" {
  title       = "2.2.1  Cloud Block Storage Encryption"
  description = "Objects stored in IBM Cloud Block Storage need to be encrypted at all times for client data security. By default all objects stored in IBM Cloud Block Storage are encrypted at-rest by ensuring user selects an encryption key from various available options."
  children = [
    control.cis_v100_2_2_1_1,
    control.cis_v100_2_2_1_2,
    control.cis_v100_2_2_1_3,
  ]

  tags = merge(local.cis_v100_2_2_1_common_tags, {
    service = "IBM/BlockStorage"
    type    = "Benchmark"
  })
}

control "cis_v100_2_2_1_1" {
  title         = "2.2.1.1 Ensure Block Storage is encrypted with customer managed keys"
  description   = "By default, IBM Cloud Block Storage provides provider-managed encryption for all data. For enhanced security, customers can bring their own encryption keys and manage them through IBM Key Management Services – Key Protect or Hyper Protect Crypto Services (HPCS). Provider-managed encryption is turned on by default and cannot be turned off."
  documentation = file("./cis_v100/docs/cis_v100_2_1_1_1.md")
  query         = query.manual_control

  tags = merge(local.cis_v100_2_2_1_common_tags, {
    cis_item_id = "2.2.1.1"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "IBM/BlockStorage"
  })
}

control "cis_v100_2_2_1_2" {
  title         = "2.2.1.2 Ensure Block Storage is encrypted with BYOK"
  description   = "By default, IBM Cloud Block Storage provides provider-managed encryption for all data. For enhanced security, customers can bring their own encryption keys and manage them through IBM Key Management Service – Key Protect . The customer can chose to use BYOK instead of provider-managed keys for enhanced security"
  documentation = file("./cis_v100/docs/cis_v100_2_2_1_2.md")
  query         = query.manual_control

  tags = merge(local.cis_v100_2_2_1_common_tags, {
    cis_item_id = "2.2.1.2"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "IBM/BlockStorage"
  })
}

control "cis_v100_2_2_1_3" {
  title         = "2.2.1.3 Ensure Block Storage is encrypted with KYOK"
  description   = "By default, IBM Cloud Block Storage provides provider-managed encryption for all data. For enhanced security, customers can bring their own encryption keys and manage them through IBM Key Management Service – Hyper Protect Crypto Services (HPCS). The customer can chose to use BYOK instead of provider-managed keys for enhanced security"
  documentation = file("./cis_v100/docs/cis_v100_2_2_1_3.md")
  query         = query.manual_control

  tags = merge(local.cis_v100_2_2_1_common_tags, {
    cis_item_id = "2.2.1.3"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "IBM/BlockStorage"
  })
}

control "cis_v100_2_2_2" {
  title         = "2.2.2 Ensure 'OS disk' are encrypted with Customer managed keys"
  description   = "By default, IBM Cloud Block Storage provides provider-managed encryption for all data. For enhanced security, customers can bring their own encryption keys and manage them through IBM Key Management Services – Key Protect or Hyper Protect Crypto Services (HPCS). Provider-managed encryption is turned on by default and cannot be turned off."
  documentation = file("./cis_v100/docs/cis_v100_2_2_2.md")
  query         = query.manual_control

  tags = merge(local.cis_v100_2_2_common_tags, {
    cis_item_id = "2.2.2"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "IBM/BlockStorage"
  })
}

control "cis_v100_2_2_3" {
  title         = "2.2.3 Ensure 'Data disks' are encrypted with customer managed keys"
  description   = "By default, IBM Cloud Block Storage provides provider-managed encryption for all data. For enhanced security, customers can bring their own encryption keys and manage them through IBM Key Management Services – Key Protect or Hyper Protect Crypto Services (HPCS). Provider-managed encryption is turned on by default and cannot be turned off."
  documentation = file("./cis_v100/docs/cis_v100_2_2_3.md")
  query         = query.manual_control

  tags = merge(local.cis_v100_2_2_common_tags, {
    cis_item_id = "2.2.3"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "IBM/BlockStorage"
  })
}

control "cis_v100_2_2_4" {
  title         = "2.2.4 Ensure 'Unattached disks' are encrypted with customer managed keys"
  description   = "By default, IBM Cloud Block Storage provides provider-managed encryption for all data. For enhanced security, customers can bring their own encryption keys and manage them through IBM Key Management Services – Key Protect or Hyper Protect Crypto Services (HPCS). Provider-managed encryption is turned on by default and cannot be turned off."
  documentation = file("./cis_v100/docs/cis_v100_2_2_4.md")
  query         = query.manual_control

  tags = merge(local.cis_v100_2_2_common_tags, {
    cis_item_id = "2.2.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "IBM/BlockStorage"
  })
}
