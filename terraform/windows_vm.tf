## Build VM

resource "vsphere_virtual_machine" "winAOCC2" {
  count=1
  name             = "winAOCC2-${count.index+1}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  firmware = "${data.vsphere_virtual_machine.win_template.firmware}"
  wait_for_guest_net_timeout = 0
  num_cpus = 2
  memory   = 8192
  ##the reason this is set this way is because ...
  guest_id = "windows9_64Guest"
  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label = "winAOCC2-${count.index+1}"
    size  = "${data.vsphere_virtual_machine.win_template.disks.0.size}"
  }
  scsi_type =  "${data.vsphere_virtual_machine.win_template.scsi_type}"
  clone {
    template_uuid = "${data.vsphere_virtual_machine.win_template.id}"
    #this section is not working need more research, maybe vsphere 6.7 issue?
    customize {
    	network_interface {
          ipv4_address = "208.11.20.${count.index+1}"
          ipv4_netmask = 24
        }
        ipv4_gateway = "208.11.20.254"
        timeout = 0
       windows_options {
          computer_name = "winAOCC2-${count.index+1}"
          #join_domain           = "area52.afnoapps.usaf.mil"
          #domain_admin_user     = "rangetech"
          #domain_admin_password = "P@ssw0rdP@ssw0rd"
          #time_zone             = "004"
      }  
    }
  }
}

resource "vsphere_virtual_machine" "winAOCUsers1" {
  count=1
  name             = "winAOCUsers1-${count.index+1}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  firmware = "${data.vsphere_virtual_machine.win_template.firmware}"
  wait_for_guest_net_timeout = 0
  num_cpus = 2
  memory   = 8192
  ##the reason this is set this way is because ...
  guest_id = "windows9_64Guest"
  #dns_servers = ""
  network_interface {
    network_id = "${data.vsphere_network.network1.id}"
  }

  disk {
    label = "winAOCUsers1-${count.index+1}"
    size  = "${data.vsphere_virtual_machine.win_template.disks.0.size}"
  }
  scsi_type =  "${data.vsphere_virtual_machine.win_template.scsi_type}"
  clone {
    template_uuid = "${data.vsphere_virtual_machine.win_template.id}"
  #this section is not working need more research, maybe vsphere 6.7 issue?
    customize {
    	network_interface {
          ipv4_address = "208.11.21.${count.index+1}"
          ipv4_netmask = 24
        }
        ipv4_gateway = "208.11.21.254"
        timeout = 0
       windows_options {
          computer_name = "winAOCC2-${count.index+1}"
          #join_domain           = "area52.afnoapps.usaf.mil"
          #domain_admin_user     = "rangetech"
          #domain_admin_password = "P@ssw0rdP@ssw0rd"
          #time_zone             = "004"
      }  
    }
  }
}

resource "vsphere_virtual_machine" "winAOCUsers2" {
  count=0
  name             = "winAOCUsers2-${count.index+1}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  firmware = "${data.vsphere_virtual_machine.win_template.firmware}"
  wait_for_guest_net_timeout = 0
  num_cpus = 2
  memory   = 8192
  ##the reason this is set this way is because ...
  guest_id = "windows9_64Guest"
  #dns_servers = ""
  network_interface {
    network_id = "${data.vsphere_network.network2.id}"
  }

  disk {
    label = "winAOCUsers2-${count.index+1}"
    size  = "${data.vsphere_virtual_machine.win_template.disks.0.size}"
  }
  scsi_type =  "${data.vsphere_virtual_machine.win_template.scsi_type}"
  clone {
    template_uuid = "${data.vsphere_virtual_machine.win_template.id}"
  #this section is not working need more research, maybe vsphere 6.7 issue?
    customize {
    	network_interface {
          ipv4_address = "208.11.23.${count.index+1}"
          ipv4_netmask = 24
        }
        ipv4_gateway = "208.11.23.254"
        timeout = 0
       windows_options {
          computer_name = "winAOCC2-${count.index+1}"
          #join_domain           = "area52.afnoapps.usaf.mil"
          #domain_admin_user     = "rangetech"
          #domain_admin_password = "P@ssw0rdP@ssw0rd"
          #time_zone             = "004"
      }  
    }
  }
}

resource "vsphere_virtual_machine" "winAOCWS" {
  count=0
  name             = "winAOCWS-${count.index+1}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  firmware = "${data.vsphere_virtual_machine.win_template.firmware}"
  wait_for_guest_net_timeout = 0
  num_cpus = 2
  memory   = 8192
  ##the reason this is set this way is because ...
  guest_id = "windows9_64Guest"
  #dns_servers = ""
  network_interface {
    network_id = "${data.vsphere_network.network3.id}"
  }

  disk {
    label = "winAOCWS-${count.index+1}"
    size  = "${data.vsphere_virtual_machine.win_template.disks.0.size}"
  }
  scsi_type =  "${data.vsphere_virtual_machine.win_template.scsi_type}"
  clone {
    template_uuid = "${data.vsphere_virtual_machine.win_template.id}"
  #this section is not working need more research, maybe vsphere 6.7 issue?
    customize {
    	network_interface {
          ipv4_address = "208.11.22.${count.index+1}"
          ipv4_netmask = 24
        }
        ipv4_gateway = "208.11.22.254"
        timeout = 0
       windows_options {
          computer_name = "winAOCC2-${count.index+1}"
          #join_domain           = "area52.afnoapps.usaf.mil"
          #domain_admin_user     = "rangetech"
          #domain_admin_password = "P@ssw0rdP@ssw0rd"
          #time_zone             = "004"
      }  
    }
  }
}
