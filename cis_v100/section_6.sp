locals {
  cis_v100_6_common_tags = merge(local.cis_v100_common_tags, {
    cis_section_id = "6"
  })
}

locals {
  cis_v100_6_1_common_tags = merge(local.cis_v100_6_common_tags, {
    cis_section_id = "6.1"
  })
  cis_v100_6_2_common_tags = merge(local.cis_v100_6_common_tags, {
    cis_section_id = "6.2"
  })
}

benchmark "cis_v100_6" {
  title         = "6 Networking"
  documentation = file("./cis_v100/docs/cis_v100_6.md")
  tags          = local.cis_v100_6_common_tags
  children = [
    benchmark.cis_v100_6_1,
    benchmark.cis_v100_6_2
  ]
}

benchmark "cis_v100_6_1" {
  title         = "6.1 IBM Cloud Internet Services"
  documentation = file("./cis_v100/docs/cis_v100_6_1.md")
  tags          = local.cis_v100_6_1_common_tags
  children = [
    control.cis_v100_6_1_1,
    control.cis_v100_6_1_2,
    control.cis_v100_6_1_3
  ]
}

control "cis_v100_6_1_1" {
  title         = "6.1.1 Enable TLS 1.2 at minimum for all inbound traffic on IBM Cloud Internet Services Proxy"
  documentation = file("./cis_v100/docs/cis_v100_6_2_1.md")
  sql           = query.internet_service_tls_higher_version_enabled.sql

  tags = merge(local.cis_v100_6_1_common_tags, {
    cis_item_id = "6.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "vpc"
  })
}

control "cis_v100_6_1_2" {
  title         = "6.1.2 Ensure Web application firewall is set to ON in IBM Cloud Internet Services (CIS)"
  documentation = file("./cis_v100/docs/cis_v100_6_2_1.md")
  sql           = query.internet_service_waf_enabled.sql

  tags = merge(local.cis_v100_6_1_common_tags, {
    cis_item_id = "6.1.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "vpc"
  })
}

control "cis_v100_6_1_3" {
  title         = "6.1.3 Ensure DDoS protection is Active on IBM Cloud Internet Services"
  documentation = file("./cis_v100/docs/cis_v100_6_2_1.md")
  sql           = query.internet_service_ddos_protection_active.sql

  tags = merge(local.cis_v100_6_1_common_tags, {
    cis_item_id = "6.1.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "vpc"
  })
}

benchmark "cis_v100_6_2" {
  title         = "6.2 IBM Virtual Private Cloud (VPC)"
  documentation = file("./cis_v100/docs/cis_v100_6.md")
  tags          = local.cis_v100_6_2_common_tags
  children = [
    control.cis_v100_6_2_1,
    control.cis_v100_6_2_2,
    control.cis_v100_6_2_3,
    control.cis_v100_6_2_4,
    control.cis_v100_6_2_5
  ]
}

control "cis_v100_6_2_1" {
  title         = "6.2.1 Ensure no VPC access control lists allow ingress from 0.0.0.0/0 to port 22"
  description   = "VPC access control lists filter all incoming and outgoing traffic in IBM Cloud VPC. An ACL is a built-in, virtual firewall where ACL rules control traffic to and from the subnets, rather than to and from the virtual servers. It is recommended that no ACL allows unrestricted ingress access to port 22."
  documentation = file("./cis_v100/docs/cis_v100_6_2_1.md")
  sql           = query.vpc_network_acl_restrict_ingress_ssh_all.sql

  tags = merge(local.cis_v100_6_2_common_tags, {
    cis_item_id = "6.2.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "vpc"
  })
}

control "cis_v100_6_2_2" {
  title         = "6.2.2 Ensure the default security group of every VPC restricts all traffic"
  description   = "VPC security groups provide stateful filtering of ingress/egress network traffic to Virtual Server. It is recommended that no security group allows unrestricted ingress access to a Virtual Server. Unless modified, the default security group allows inbound traffic from all members of the group that is, all other virtual servers that are attached to this security group."
  documentation = file("./cis_v100/docs/cis_v100_6_2_2.md")
  sql           = query.manual_control.sql

  tags = merge(local.cis_v100_6_2_common_tags, {
    cis_item_id = "6.2.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "vpc"
  })
}

control "cis_v100_6_2_3" {
  title         = "6.2.3 Ensure no VPC security groups allow ingress from 0.0.0.0/0 to port 3389"
  description   = "VPC security groups provide stateful filtering of ingress/egress network traffic to Virtual Server Instances. It is recommended that no security group allows unrestricted ingress access to port 3389."
  documentation = file("./cis_v100/docs/cis_v100_6_2_3.md")
  sql           = query.vpc_security_group_restrict_ingress_rdp_all.sql

  tags = merge(local.cis_v100_6_2_common_tags, {
    cis_item_id = "6.2.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "vpc"
  })
}

control "cis_v100_6_2_4" {
  title         = "6.2.4 Ensure no VPC security groups allow ingress from 0.0.0.0/0 to port 22"
  description   = "VPC security groups provide stateful filtering of ingress/egress network traffic to Virtual Servers. It is recommended that no security group allows unrestricted ingress access to port 22."
  documentation = file("./cis_v100/docs/cis_v100_6_2_4.md")
  sql           = query.vpc_security_group_restrict_ingress_ssh_all.sql

  tags = merge(local.cis_v100_6_2_common_tags, {
    cis_item_id  = "6.2.4"
    cis_level    = "1"
    cis_type     = "manual"
    service      = "vpc"
  })
}

control "cis_v100_6_2_5" {
  title         = "6.2.5 Ensure no VPC access control lists allow ingress from 0.0.0.0/0 to port 3389"
  description   = "VPC access control lists filter all incoming and outgoing traffic in IBM Cloud VPC. An ACL is a built-in, virtual firewall where ACL rules control traffic to and from the subnets, rather than to and from the virtual servers. It is recommended that no ACL allows unrestricted ingress access to port 3389."
  documentation = file("./cis_v100/docs/cis_v100_6_2_5.md")
  sql           = query.vpc_network_acl_restrict_ingress_rdp_all.sql

  tags = merge(local.cis_v100_6_2_common_tags, {
    cis_item_id = "6.2.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "vpc"
  })
}
