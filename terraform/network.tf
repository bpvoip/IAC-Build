## Build VM

resource "vsphere_virtual_machine" "RTR0" {
  count=1
  name             = "RTR0"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  #firmware = "${data.vsphere_virtual_machine.RTR0_template.firmware}"
  wait_for_guest_net_timeout = 0
  num_cpus = 2
  memory   = 8192
  ##the reason this is set this way is because ...
  guest_id = "centos7_64Guest"
  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }
  network_interface {
    network_id = "${data.vsphere_network.network4.id}"
  }
  network_interface {
    network_id = "${data.vsphere_network.network5.id}"
  }
  network_interface {
    network_id = "${data.vsphere_network.network6.id}"
  }
  disk {
    label = "RTR0"
    size  = "${data.vsphere_virtual_machine.RTR0_template.disks.0.size}"
  }
  scsi_type =  "${data.vsphere_virtual_machine.RTR0_template.scsi_type}"
  clone {
    template_uuid = "${data.vsphere_virtual_machine.RTR0_template.id}"
    #this section is not working need more research, maybe vsphere 6.7 issue?
  }
}

resource "vsphere_virtual_machine" "RTR1" {
  count=1
  name             = "RTR1"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  firmware = "${data.vsphere_virtual_machine.RTR1_template.firmware}"
  wait_for_guest_net_timeout = 0
  num_cpus = 2
  memory   = 8192
  ##the reason this is set this way is because ...
  guest_id = "centos7_64Guest"
  #dns_servers = ""
  network_interface {
    network_id = "${data.vsphere_network.network1.id}"
  }
  network_interface {
    network_id = "${data.vsphere_network.network4.id}"
  }
  network_interface {
    network_id = "${data.vsphere_network.network7.id}"
  }
  disk {
    label = "RTR1"
    size  = "${data.vsphere_virtual_machine.RTR1_template.disks.0.size}"
  }
  scsi_type =  "${data.vsphere_virtual_machine.RTR1_template.scsi_type}"
  clone {
    template_uuid = "${data.vsphere_virtual_machine.RTR1_template.id}"
  }
}

resource "vsphere_virtual_machine" "RTR2" {
  count=0
  name             = "RTR2"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  firmware = "${data.vsphere_virtual_machine.RTR2_template.firmware}"
  wait_for_guest_net_timeout = 0
  num_cpus = 2
  memory   = 8192
  ##the reason this is set this way is because ...
  guest_id = "centos7_64Guest"
  #dns_servers = ""
  network_interface {
    network_id = "${data.vsphere_network.network8.id}"
  }
  network_interface {
    network_id = "${data.vsphere_network.network5.id}"
  }
  network_interface {
    network_id = "${data.vsphere_network.network9.id}"
  }
  disk {
    label = "RTR2"
    size  = "${data.vsphere_virtual_machine.RTR2_template.disks.0.size}"
  }
  scsi_type =  "${data.vsphere_virtual_machine.RTR2_template.scsi_type}"
  clone {
    template_uuid = "${data.vsphere_virtual_machine.RTR2_template.id}"
  }
}

resource "vsphere_virtual_machine" "RTR3" {
  count=0
  name             = "RTR3"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  firmware = "${data.vsphere_virtual_machine.RTR3_template.firmware}"
  wait_for_guest_net_timeout = 0
  num_cpus = 2
  memory   = 8192
  ##the reason this is set this way is because ...
  guest_id = "centos7_64Guest"
  #dns_servers = ""
  network_interface {
    network_id = "${data.vsphere_network.network2.id}"
  }
  network_interface {
    network_id = "${data.vsphere_network.network7.id}"
  }
  network_interface {
    network_id = "${data.vsphere_network.network9.id}"
  }
  disk {
    label = "RTR3"
    size  = "${data.vsphere_virtual_machine.RTR3_template.disks.0.size}"
  }
  scsi_type =  "${data.vsphere_virtual_machine.RTR3_template.scsi_type}"
  clone {
    template_uuid = "${data.vsphere_virtual_machine.RTR3_template.id}"
  }
}
