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
resource "ibm_is_ssh_key" "ssh_key_id" {
    name = "instana-ssh"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDVyX2htDl8OZsUb5IYq3nKDEpHcGqTWX0jMwFZbBpUU4nuHIDNr2Kj5EvTifbN+NVY3T4X4WzuqQlcIJH8BOS2xTSqV9iudVWGGrLLU/+nkCAzOIaRWhC9owoe6DHOTPqg963obZ9idMsNKKw7jvBD+olvmflglozuNUVEh66509fzpjTbYqI03D9h+Xcsvld4nSCXm+vq3F2D63uJ+895fMY1F/Ufkdd7y3yACsL27CLi3gKeQHZDvnikDtf94sUhgD93WXUymcE/tKxp9nHrUwRmlmZ3mBx+wneMDY/qg9yhW6SplFTpnnGVjc+EHLv6oYYxVDsGpzRcEjcfSuFVyGUMIgyjCTKkTqReAQuonwxOF6FgZLMWfFokKr+cZiLC0H9NSqtSx+EWu+NkhXI8/E9Js3AVBY9MAFFLlfNOyJtS3TDFClOpTTrb++w5BkbrAqY2fPePy0D2nXgMsFfB+MZlLyVCv98Q0CRlDzIzaE96lZD/INB3WGF/ORiwwrE="
}

data "ibm_is_image" "centos" {
    name = "ibm-centos-7-6-minimal-amd64-1"
}

resource "ibm_is_instance" "vsi-cassandra" {
    count   = var.cassandra_qtde
    name    = "${var.cassandra_basename}-${count.index + 1}"
    vpc     = ibm_is_vpc.vpc-instance.id
    zone    = var.zone
    keys    = [ibm_is_ssh_key.ssh_key_id.id]
    image   = data.ibm_is_image.centos.id
    profile = var.cassandra_profile

    primary_network_interface {
        subnet          = ibm_is_subnet.subnet1.id
        security_groups = [ibm_is_security_group.sg1.id]
    }
}