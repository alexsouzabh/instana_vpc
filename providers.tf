##############################################################################
# Terraform Providers
##############################################################################

terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = ">=1.19.0"
      generation = 2
    }
  }
}

##############################################################################


##############################################################################
# Provider
##############################################################################

provider ibm {
  iaas_classic_username = var.iaas_classic_username
  iaas_classic_api_key  = var.iaas_classic_api_key
  ibmcloud_timeout      = 60
  region                = var.region
}

##############################################################################