##############################################################################
# Account variables
##############################################################################

###################################
## GERAL VARIABLES
###################################

variable iaas_classic_username {
  description = "IBM Cloud classic username"
  default = "apikey"
  type        = string
}

variable iaas_classic_api_key {
  description = "IBM Cloud classic api key"
  type        = string
}

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

#variable vpc-prefix {
# default     = "10.200.0.0/16"
# description = "VPC IP ADD"
#}

variable vpc-prefix {
 default     = ["10.200.0.0/20","10.200.16.0/20","10.200.32.0/20"]
 description = "VPC IP ADD"
 type=list
}

variable vpc-zones {
 default     = ["us-south1","us-south2","us-south3"]
 description = "Zones to be configures"
 type=list
}

variable vpc-zones-ips {
 default     = ["10.200.0.0/24","10.200.16.0/24","10.200.32.0/24"]
 description = "Zones to be configures"
 type=list
}

variable ipv4-zone01 {
 default     = "10.200.1.0/24"
 description = "Base name for network components."
}

###################################
## CASSANDRA VARIABLES
###################################

variable cassandra_basename {
 default     = "srv-cassandra"
 description = "Base name for network components."
}

variable cassandra_qtde {
 default     = 1
 description = "Number of cassandra instances"
}

variable cassandra_profile {
 default     = "bx2-2x8"
 description = "Number of cassandra instances"
}

##################################
variable TF_VERSION {
 default     = "˜> 1.1"
 description = "The version of the Terraform engine that's used in the Schematics workspace."
}

