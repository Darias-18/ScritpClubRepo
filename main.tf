
data "akamai_group" "daniel_group" {
     group_name   = "Security Costa Rica-F-F2JX9E"
     contract_id  = "ctr_F-F2JX9E"     
}

data "akamai_appsec_configuration" "InfoSecGurus" {
    name = "InfoSecGurus"
}

data "akamai_property" "my_property" {
    name = "InfoSecGurus"
    #version = "1"
}





#output "my_group" {
 #   value = data.akamai_group.daniel_group
#}

#output "my_appsec_config" {
 # value = data.akamai_appsec_configuration.InfoSecGurus
#}

#output "my_property" {
 # value = data.akamai_property.my_property
#}
