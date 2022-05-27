## Build VM

resource "vsphere_virtual_machine" "server_2019" {
  count=1
  name             = "DCAOCC2-${count.index+1}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  firmware = "${data.vsphere_virtual_machine.DC_template.firmware}"
  wait_for_guest_net_timeout = 0
  num_cpus = 2
  memory   = 8192
  ##the reason this is set this way is because ...
  guest_id = "windows9_64Guest"
  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label = "DCAOCC2-${count.index+1}"
    size  = "${data.vsphere_virtual_machine.DC_template.disks.0.size}"
  }
  scsi_type =  "${data.vsphere_virtual_machine.DC_template.scsi_type}"
  clone {
    template_uuid = "${data.vsphere_virtual_machine.DC_template.id}"
    #this section is not working need more research, maybe vsphere 6.7 issue?
    customize {
       windows_options {
          computer_name = "DCAOCC2-1"
    #      #join_domain           = "domainname"
    #      #domain_admin_user     = "rangetech"
    #      #domain_admin_password = "P@ssw0rdP@ssw0rd"
    #      #time_zone             = "004"
    }
      network_interface {
          ipv4_address = "208.11.20.253"
          ipv4_netmask = 24
      }
      ipv4_gateway = "208.11.20.254"
      timeout = 0
    }
  }
}

