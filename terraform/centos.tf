## Build VM

resource "vsphere_virtual_machine" "centosAOCC2" {
  count=1
  name             = "centosAOCC2-${count.index+1}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  firmware = "${data.vsphere_virtual_machine.centos_template.firmware}"
  wait_for_guest_net_timeout = 0
  num_cpus = 2
  memory   = 8192
  ##the reason this is set this way is because ...
  guest_id = "centos7_64Guest"
  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label = "centosAOCC2-${count.index+1}"
    size  = "${data.vsphere_virtual_machine.centos_template.disks.0.size}"
  }
  scsi_type =  "${data.vsphere_virtual_machine.centos_template.scsi_type}"
  clone {
    template_uuid = "${data.vsphere_virtual_machine.centos_template.id}"
    #this section is not working need more research, maybe vsphere 6.7 issue?
    customize {
       linux_options {
          host_name = "centosAOCC2-${count.index+1}"
          domain = "local"
          #join_domain           = "domainname"
          #domain_admin_user     = "rangetech"
          #domain_admin_password = "P@ssw0rdP@ssw0rd"
          #time_zone             = "004"
      }
      network_interface {
          ipv4_address = "208.11.20.${count.index+100}"
          ipv4_netmask = 24
      }
      ipv4_gateway = "208.11.20.254"
      timeout = 10
    }
  }
}

resource "vsphere_virtual_machine" "centosAOCUsers1" {
  count=0
  name             = "centosAOCUsers1-${count.index+1}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  firmware = "${data.vsphere_virtual_machine.centos_template.firmware}"
  wait_for_guest_net_timeout = 0
  num_cpus = 2
  memory   = 8192
  ##the reason this is set this way is because ...
  guest_id = "centos7_64Guest"
  #dns_servers = ""
  network_interface {
    network_id = "${data.vsphere_network.network1.id}"
  }

  disk {
    label = "centosAOCUsers1-${count.index+1}"
    size  = "${data.vsphere_virtual_machine.centos_template.disks.0.size}"
  }
  scsi_type =  "${data.vsphere_virtual_machine.centos_template.scsi_type}"
  clone {
    template_uuid = "${data.vsphere_virtual_machine.centos_template.id}"
  #this section is not working need more research, maybe vsphere 6.7 issue?
    #customize {
    #   windows_options {
    #      computer_name = "centosAOCC2-1"
    #      #join_domain           = "domainname"
    #      #domain_admin_user     = "rangetech"
    #      #domain_admin_password = "P@ssw0rdP@ssw0rd"
    #      #time_zone             = "004"
    #  }
    #  network_interface {
    #      ipv4_address = "208.11.20.1"
    #      ipv4_netmask = 24
    #  }
    #  ipv4_gateway = "208.11.20.254"
    #  timeout = 10
    #}
  }
}

resource "vsphere_virtual_machine" "centosAOCUsers2" {
  count=0
  name             = "centosAOCUsers2-${count.index+1}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  firmware = "${data.vsphere_virtual_machine.centos_template.firmware}"
  wait_for_guest_net_timeout = 0
  num_cpus = 2
  memory   = 8192
  ##the reason this is set this way is because ...
  guest_id = "centos7_64Guest"
  #dns_servers = ""
  network_interface {
    network_id = "${data.vsphere_network.network2.id}"
  }

  disk {
    label = "centosAOCUsers2-${count.index+1}"
    size  = "${data.vsphere_virtual_machine.centos_template.disks.0.size}"
  }
  scsi_type =  "${data.vsphere_virtual_machine.centos_template.scsi_type}"
  clone {
    template_uuid = "${data.vsphere_virtual_machine.centos_template.id}"
  #this section is not working need more research, maybe vsphere 6.7 issue?
    #customize {
    #   windows_options {
    #      computer_name = "centosAOCC2-1"
    #      #join_domain           = "domainname"
    #      #domain_admin_user     = "rangetech"
    #      #domain_admin_password = "P@ssw0rdP@ssw0rd"
    #      #time_zone             = "004"
    #  }
    #  network_interface {
    #      ipv4_address = "208.11.20.1"
    #      ipv4_netmask = 24
    #  }
    #  ipv4_gateway = "208.11.20.254"
    #  timeout = 10
    #}
  }
}

resource "vsphere_virtual_machine" "centosAOCWS" {
  count=0
  name             = "centosAOCWS-${count.index+1}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  firmware = "${data.vsphere_virtual_machine.centos_template.firmware}"
  wait_for_guest_net_timeout = 0
  num_cpus = 2
  memory   = 8192
  ##the reason this is set this way is because ...
  guest_id = "centos7_64Guest"
  #dns_servers = ""
  network_interface {
    network_id = "${data.vsphere_network.network3.id}"
  }

  disk {
    label = "centosAOCWS-${count.index+1}"
    size  = "${data.vsphere_virtual_machine.centos_template.disks.0.size}"
  }
  scsi_type =  "${data.vsphere_virtual_machine.centos_template.scsi_type}"
  clone {
    template_uuid = "${data.vsphere_virtual_machine.centos_template.id}"
  #this section is not working need more research, maybe vsphere 6.7 issue?
    #customize {
    #   windows_options {
    #      computer_name = "centosAOCC2-1"
    #      #join_domain           = "domainname"
    #      #domain_admin_user     = "rangetech"
    #      #domain_admin_password = "P@ssw0rdP@ssw0rd"
    #      #time_zone             = "004"
    #  }
    #  network_interface {
    #      ipv4_address = "208.11.20.1"
    #      ipv4_netmask = 24
    #  }
    #  ipv4_gateway = "208.11.20.254"
    #  timeout = 10
    #}
  }
}
