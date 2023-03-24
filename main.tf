############################
# Virtual Private Cloud
############################
 
# Virtual Private Cloud
resource "ibm_is_vpc" "vpc-instance" {
  name = "${var.netbasename}-vpc"
  address_prefix_management = "manual"
}

resource "ibm_is_vpc_address_prefix" "vpc-instance" {
  cidr = var.vpc-prefix
  name = "vpc-network"
  vpc  = ibm_is_vpc.vpc-instance.id
  zone = var.zone
}

# Subnet 
resource "ibm_is_subnet" "subnet1" {
  depends_on = [
    ibm_is_vpc_address_prefix.vpc-instance
  ]
   #name                     = "${var.netbasename}-subnet1"
   name                     = "subnet1"
   vpc                      = ibm_is_vpc.vpc-instance.id
   zone                     = var.zone
   ipv4_cidr_block          = var.ipv4-zone01
}


# Security group
resource "ibm_is_security_group" "sg1" {
   name = "${var.netbasename}-sg1"
   vpc  = ibm_is_vpc.vpc-instance.id
}
 
# allow all incoming network traffic on port 22
resource "ibm_is_security_group_rule" "example-ingress_ssh_all" {
   group     = ibm_is_security_group.sg1.id
   direction = "inbound"
   remote    = "0.0.0.0/0"
 
   tcp {
     port_min = 22
     port_max = 22
   }
}
 

############################
## Server configuration
############################

data "ibm_is_image" "centos" {
    name = "ibm-centos-7-6-minimal-amd64-1"
}

resource "ibm_is_instance" "vsi-cassandra" {
    name    = "cassandra"
    vpc     = ibm_is_vpc.vpc-instance.id
    zone    = var.zone
    #keys    = [data.ibm_is_ssh_key.ssh_key_id.id]
    image   = data.ibm_is_image.centos.id
    profile = "bx2-2x8"

    primary_network_interface {
        subnet          = ibm_is_subnet.subnet1.id
        security_groups = [ibm_is_security_group.sg1.id]
    }
}