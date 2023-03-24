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
 default     = "us-south-1"
 description = "DC Zone"
}

###################################
## VPC VARIABLES
###################################

variable netbasename {
 default     = "instana-network"
 description = "Base name for network components."
}

variable vpc-prefix {
 default     = "10.200.1.0/16"
 description = "VPC IP ADD"
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
