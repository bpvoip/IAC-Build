data "vsphere_datacenter" "dc" {
  name = "Datacenter1"
}
data "vsphere_resource_pool" "pool" {
  name = "RP1"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_datastore" "datastore" {
  name          = "datastore1"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_network" "network" {
  name          = "AOCC2"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_network" "network1" {
  name          = "AOCUsers1"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_network" "network2" {
  name          = "AOCUsers2"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_network" "network3" {
  name          = "AOCWS"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
} 
data "vsphere_network" "network4" {
  name          = "RTR0RTR1"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
} 
data "vsphere_network" "network5" {
  name          = "RTR0RTR2"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_network" "network6" {
  name          = "RTR0FW1"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_network" "network7" {
  name          = "RTR1RTR3"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_network" "network8" {
  name          = "RTR2FW2"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_network" "network9" {
  name          = "RTR2RTR3"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_virtual_machine" "win_template" {
  name = "win10"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_virtual_machine" "centos_template" {
  name = "centos"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_virtual_machine" "RTR0_template" {
  name = "PE1RTR0"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_virtual_machine" "RTR1_template" {
  name = "PE1RTR1"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_virtual_machine" "RTR2_template" {
  name = "PE1RTR2"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_virtual_machine" "RTR3_template" {
  name = "PE1RTR3"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_virtual_machine" "DC_template" {
  name = "server-2019-dc"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
