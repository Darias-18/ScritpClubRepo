resource "akamai_property" "my_property" {
    name    	= "Darias_terraform_property"
    product_id  = "prd_SPM"
    contract_id = data.akamai_group.daniel_group.contract_id
    group_id    = data.akamai_group.daniel_group.id
    rules = data.akamai_property_rules_builder.darias_terraform_rule.json
     hostnames {
       cname_from = "www.dariasTerraform.com"
       cname_to = akamai_edge_hostname.my_edge_hostname.edge_hostname
       cert_provisioning_type = "DEFAULT"
     }
}

resource "akamai_cp_code" "darias_cp_code" {
  name        = "dariasTerraformCpCode"
  contract_id = data.akamai_group.daniel_group.contract_id
  group_id    = data.akamai_group.daniel_group.id
  product_id  = "prd_SPM"
  timeouts {
    update = "1h"
  }
}

resource "akamai_edge_hostname" "my_edge_hostname" {
  product_id    = "prd_SPM"
  contract_id   = data.akamai_group.daniel_group.contract_id
  group_id      = data.akamai_group.daniel_group.id
  edge_hostname = "www.dariasTerraform.com.edgesuite.net"
  ip_behavior   = "IPV4"
  ttl           = 300
  timeouts {
    default = "1h"
  }
}


data "akamai_property_rules_builder" "darias_terraform_rule" {
  rules_v2023_01_05 {
    name      = "default"
    is_secure = false
    comments  = <<-EOT
      The behaviors in the default rule apply to all requests for the property hostnames unless another rule overrides these settings.
    EOT
    behavior {
      origin {
        origin_type                   = "CUSTOMER"
        hostname                      = "dariasTerraform.org"
        forward_host_header           = "ORIGIN_HOSTNAME"
        cache_key_hostname            = "REQUEST_HOST_HEADER"
        compress                      = true
        enable_true_client_ip         = false
        http_port                     = 80
      }
    }
    behavior {
      cp_code {
        value {
          id   = akamai_cp_code.darias_cp_code.id
          name = akamai_cp_code.darias_cp_code.name
        }
      }
    }
  
  }
}
