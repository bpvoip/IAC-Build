#packer {
#  required_version = ">= 1.7.4"
#
#  required_plugins {
#    windows-update = {
#      version = "0.14.0"
#      source = "github.com/rgl/windows-update"
#      # Github Plugin Repo https://github.com/rgl/packer-plugin-windows-update
#    }
#  }
#}

source "vsphere-iso" "win_10" {
  insecure_connection     = true

  vcenter_server          = var.vcenter_server
  username                = var.vcenter_username
  password                = var.vcenter_password

  #cluster                 = var.vcenter_cluster
  datacenter              = var.vcenter_datacenter
  host                    = var.vcenter_host
  datastore               = var.vcenter_datastore
  folder                  = var.vcenter_folder

  convert_to_template     = true
  notes                   = "Windows 10 Pro x64 VM template built using Packer.\nThis template is syspred and can be used for domain deployments."

  ip_wait_timeout         = "20m"
  ip_settle_timeout       = "1m"
  communicator            = "winrm"
  #winrm_port             = "5985"
  winrm_timeout           = "10m"
  pause_before_connecting = "1m"
  winrm_username          = var.os_username
  winrm_password          = var.os_password_workstation

  vm_name                 = "${var.vm_name}"
  vm_version              = var.vm_version
  firmware                = var.vm_firmware
  guest_os_type           = var.vm_guest_os_type
  CPUs                    = var.cpu_num
  CPU_hot_plug            = true
  RAM                     = var.ram
  RAM_reserve_all         = false
  RAM_hot_plug            = true
  video_ram               = "16384"
  cdrom_type              = "sata"
  disk_controller_type    = ["lsilogic-sas"]
    
  network_adapters {
    network               = var.vm_network
    network_card          = var.network_card
  }
  
   storage {
    disk_thin_provisioned = true
    disk_size             = var.disk_size
  }

  iso_paths = [
    var.os_iso_path,
    var.vmtools_iso_path
  ]

  floppy_dirs = ["scripts",]
  floppy_files = ["unattended/autounattend.xml"]

  boot_wait    = "3s"
  boot_command = [
    "<spacebar><spacebar>"
  ]
}

build {
  /* 
  Note that provisioner "Windows-Update" performs Windows updates and reboots where necessary.
  Run the update provisioner as many times as you need. I found that 3-to-4 runs tended,
  to be enough to install all available Windows updates. Do check yourself though!
  */

  sources = ["source.vsphere-iso.win_10"]

  provisioner "windows-restart" { # A restart to settle Windows prior to updates
    pause_before    = "1m"
    restart_timeout = "15m"
  }
  
  provisioner "powershell" {
    pause_before      = "1m"
    elevated_user     = var.os_username
    elevated_password = var.os_password_workstation
    script            = "scripts/customise_win_10.ps1"
    timeout           = "15m"
  }

  provisioner "windows-restart" { # A restart before sysprep to settle the VM once more.
    pause_before    = "1m"
    restart_timeout = "1h"
  }

  #provisioner "powershell" {
  #  pause_before      = "1m"
  #  elevated_user     = var.os_username
  #  elevated_password = var.os_password_workstation
  #  script            = "scripts/sysprep_win_10.ps1"
  #  timeout           = "15m"
  #}
}