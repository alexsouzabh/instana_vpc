##############################################################################
# Account variables
##############################################################################

variable TF_VERSION {
 default     = "0.13"
 description = "The version of the Terraform engine that's used in the Schematics workspace."
}

variable DC {
  default = "SAO01"
  description = "Datacenter that will be used for the Baremetal"
}

variable SO {
  default = "UBUNTU_LATEST"
  description = "Operation System"
}

variable iaas_classic_username {
  description = "IBM Cloud classic username"
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

##############################################################################
# Baremetal Variables
##############################################################################

variable hostname {
  description = "Name of host for virtual server"
  type        = string
  default     = "example-baremetal"
}

variable domain {
  description = "Domain name for baremetal server"
  type        = string
  default     = "example.com"
}

variable fixed_config_preset  {
  description = "Config preset for baremetal server"
  type        = string
}

//variable private_vlan_id {
//  description = "Private VLAN ID"
//}

##############################################################################