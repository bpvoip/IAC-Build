variable "vcenter_server" {
    description = "vCenter server to build the VM on"
}
variable "vcenter_username" {
    description = "Username to authenticate to vCenter"
}
variable "vcenter_password" {
    description = "Password to authenticate to vCenter"
    default     = ""
}
variable "vcenter_cluster" {}
variable "vcenter_datacenter" {}
variable "vcenter_host" {}
variable "vcenter_datastore" {}
variable "vcenter_folder" {
    description = "The vcenter folder to store the template"
}
variable "connection_username" {
    default = ""
}
variable "connection_password" {
    default = ""
}
variable "vm_hardware_version" {
    default = "13"
}
variable "iso_checksum" {}
variable "os_version" {}
variable "os_iso_path" {}
variable "guest_os_type" {}
variable "root_disk_size" {
    default = 48000
}
variable "nic_type" {
    default = "vmxnet3"
}
variable "vm_network1" { }
variable "vm_network2" { }
variable "vm_network3" { }
variable "vm_network4" { }

variable "num_cpu" {
    default = 4
}
variable "num_cores" {
    default = 1
}
variable "vm_ram" {
    default = 1024
}
variable "os_family" {
    description = "OS Family builds the paths needed for packer"
    default = ""
}
variable "os_iso_url" {
    description = "The download url for the ISO"
    default = ""
}
variable "http_ip" {
    description = "The ip of this host"
    default = ""
}
variable "http_directory" {
    description = "The folder containing the kickstartO"
    default = ""
}

variable "boot_command" {} #TODO: Figure out a better way to handle this