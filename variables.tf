##############################################################################
# Account variables
##############################################################################

###################################
## GERAL VARIABLES
###################################

variable region {
 default     = "us-south"
 description = "DC Zone"
}

variable zone {
 default     = "DAL01"
 description = "DC Zone"
}

###################################
## VPC VARIABLES
###################################

variable netbasename {
 default     = "instana-network"
 description = "Base name for network components."
}

variable ipv4-zone01 {
 default     = "10.200.1.0/24"
 description = "Base name for network components."
}

##################################
variable TF_VERSION {
 default     = "0.13"
 description = "The version of the Terraform engine that's used in the Schematics workspace."
}

variable DC {
  default = "sao01"
  description = "Datacenter that will be used for the Baremetal"
}

variable SO {
  default = "UBUNTU_LATEST"
  description = "Operation System"
}

variable server_qtde {
  default = 5
  description = "Quantity of servers"
}

variable iaas_classic_username {
  description = "IBM Cloud classic username"
  default = "apikey"
  type        = string
}

variable iaas_classic_api_key {
  description = "IBM Cloud classic api key"
  type        = string
}

variable resource_group {
    description = "Name of resource group where all infrastructure will be provisioned"
    type        = string
    default     = "asset-development"

validation  {
      error_message = "Unique ID must begin and end with a letter and contain only letters, numbers, and - characters."
      condition     = can(regex("^([a-z]|[a-z][-a-z0-9]*[a-z0-9])$", var.resource_group))
    }
}

variable hostname {
  description = "Name of host for virtual server"
  type        = string
  default     = "example-baremetal"
}

variable hostname02 {
  description = "Name of host for virtual server abc"
  type        = string
  default     = "example-bare"
}

variable domain {
  description = "Domain name for baremetal server"
  type        = string
  default     = "example.com"
}
