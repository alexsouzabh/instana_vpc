##############################################################################
# Create Baremetal Server
##############################################################################

resource "ibm_network_vlan" "test_vlan_public" {
  name            = "public_vlan"
  datacenter      = var.DC
  type            = "PUBLIC"
  tags = [
    "collectd",
    "mesos-master",
  ]
}

resource "ibm_network_vlan" "test_vlan_private" {
  name            = "private_vlan"
  datacenter      = var.DC
  type            = "PRIVATE"
  tags = [
    "collectd",
    "mesos-master",
  ]
}

resource "ibm_compute_vm_instance" "twc_terraform_sample" {
  count                      = var.server_qtde
  hostname                   = "Server-0$(count.index + 1)"
  domain                     = var.domain
  os_reference_code          = var.SO
  datacenter                 = var.DC
  network_speed              = 100
  hourly_billing             = true
  private_network_only       = false
  cores                      = 1
  memory                     = 1024
  disks                      = [25, 10, 20]
  user_metadata              = "{\"value\":\"newvalue\"}"
  dedicated_acct_host_only   = true
  local_disk                 = false
  public_vlan_id             = ibm_network_vlan.test_vlan_public.id
  private_vlan_id            = ibm_network_vlan.test_vlan_private.id
  depends_on = [
    ibm_network_vlan.test_vlan_private,
    ibm_network_vlan.test_vlan_public
  ]
  
}

#resource ibm_compute_bare_metal baremetal {
#    hostname             = var.hostname
#    domain               = var.domain
#    os_reference_code    = var.SO
#    datacenter           = var.DC
#    hourly_billing       = true 
#    private_network_only = true
#    fixed_config_preset  = var.fixed_config_preset
#    //private_vlan_id      = var.private_vlan_id
#
#    user_metadata = "{\"value\":\"newvalue\"}" # Optional
#    tags = [
#      "delete-me"
#    ]
#    notes = "note test"
#}


##############################################################################s