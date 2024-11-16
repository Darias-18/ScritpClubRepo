
terraform {
  required_providers {
    akamai = {
      source  = "akamai/akamai"
      version = "~> 6.1"
    }
  }
  required_version = ">= 1.8"
}
 
provider "akamai" {
  edgerc         = "~/.edgerc"
  config_section = "Security_CR"
}

