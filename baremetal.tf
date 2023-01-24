##############################################################################
# Create Baremetal Server
##############################################################################

resource ibm_compute_bare_metal baremetal {
    hostname             = var.hostname
    domain               = var.domain
    os_reference_code    = "UBUNTU_16_64"
    datacenter           = var.DC
    hourly_billing       = true 
    private_network_only = true
    fixed_config_preset  = var.fixed_config_preset
    private_vlan_id      = var.private_vlan_id

    user_metadata = "{\"value\":\"newvalue\"}" # Optional
    tags = [
      "delete-me"
    ]
    notes = "note test"
}

##############################################################################s