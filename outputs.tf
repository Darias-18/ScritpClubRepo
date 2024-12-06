 output "my_group" {
    value = data.akamai_group.daniel_group
} 

 output "my_appsec_config" {
 value = data.akamai_appsec_configuration.InfoSecGurus
} 

output "my_property" {
 value = data.akamai_property.my_property
} 
