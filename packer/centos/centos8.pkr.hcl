source "vsphere-iso" "centos" {
  # vCenter settings
  vcenter_server      = var.vcenter_server
  username            = var.vcenter_username
  password            = var.vcenter_password
  insecure_connection = true #TODO: Add ca to docker
  #cluster             = var.vcenter_cluster
  datacenter          = var.vcenter_datacenter
  host                = var.vcenter_host
  datastore           = var.vcenter_datastore
  convert_to_template = true
  folder              = var.vcenter_folder

  # VM Settings
  ip_wait_timeout       = "45m"
  ssh_username          = var.connection_username
  ssh_password          = var.connection_password
  ssh_timeout           = "12h"
  ssh_port              = "22"
  ssh_handshake_attempts = "20"
  shutdown_timeout      = "15m"
  vm_version            = var.vm_hardware_version
  iso_paths             = [var.os_iso_path]
  #iso_checksum          = var.iso_checksum
  vm_name               = "centos"
  guest_os_type         = var.guest_os_type
  disk_controller_type  = ["pvscsi"]
  network_adapters {
    network = var.vm_AOCC2_network
    network_card = var.nic_type
  }
  storage {
    disk_size = var.root_disk_size
    disk_thin_provisioned = true
  }
  CPUs                  = var.num_cpu
  cpu_cores             = var.num_cores
  CPU_hot_plug          = true
  RAM                   = var.vm_ram
  RAM_hot_plug          = true

  
  
   # CentOS OS parameters
    boot_order            = "disk,cdrom,floppy"
    boot_wait             = "10s"
    http_ip               = var.http_ip
    http_directory        = var.http_directory
    boot_command          = var.boot_command  
  
}

build {
    sources = [
        "source.vsphere-iso.centos",
    ]
    provisioner "shell" {
      execute_command = "echo '${var.connection_password}' | {{.Vars}} sudo -S -E sh -eux '{{.Path}}'" # This runs the scripts with sudo
      scripts = [
          #"scripts/ansible-centos.sh",
          #"scripts/vmware-centos.sh",
          #"scripts/yum-update.sh",
          #"scripts/cleanup-centos.sh",
          "scripts/clean-ssh-hostkeys.sh"
      ]
    }
}