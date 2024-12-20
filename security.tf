resource "akamai_appsec_configuration" "create_config" {
 name        = "darias Terraform Configuration"
 description = "This is my new configuration created with Terraform"
 contract_id = replace(data.akamai_group.daniel_group.contract_id, "ctr_", "")
 group_id    = var.group_id
 host_names  = ["www.dariasTerraform.com"]
}

resource "akamai_appsec_security_policy" "security_policy_create" {
  config_id              = akamai_appsec_configuration.create_config.id
  default_settings       = true
  security_policy_name   = "Terraform Policy"
  security_policy_prefix = "tfpl"
}