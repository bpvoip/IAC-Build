source "vsphere-iso" "windows_2019" {
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
  communicator          = "winrm"
  winrm_username        = var.connection_username
  winrm_password        = var.connection_password
  winrm_timeout         = "12h"
  winrm_port            = "5985"
  shutdown_command      = "shutdown /s /t 10 /f /d p:4:1 /c \"Packer Shutdown\""
  shutdown_timeout      = "15m"
  vm_version            = var.vm_hardware_version
  iso_paths              = [
      "[datastore1] ISO/server_2019.iso"
  ]
  #iso_checksum          = var.iso_checksum
  vm_name               = "server-2019-dc"
  guest_os_type         = var.guest_os_type
  disk_controller_type  = ["pvscsi"] # Windows requires vmware tools drivers for pvscsi to work
  network_adapters {
    # For windows, the vmware tools network drivers are required to be connected by floppy before tools is installed
    network = var.vm_network
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
   floppy_dirs = ["scripts",]
   floppy_files          = [
      "./boot_config/Autounattend.xml",
      "./scripts/winrm.bat",
      "./scripts/Install-VMWareTools.ps1",
      "./drivers/"
  ]
}


build {
    # Windows builds
    sources = [
        "source.vsphere-iso.windows_2019",
    ]
    provisioner "powershell" {
        elevated_user = var.connection_username
        elevated_password = var.connection_password
        scripts = [
            "scripts/Disable-UAC.ps1" # I re-enable UAC with ansible post deployment
        ]
    }
    
    provisioner "powershell" {
        elevated_user = var.connection_username
        elevated_password = var.connection_password
        scripts = [
            "scripts/makedc.ps1",
            #"scripts/Remove-UpdateCache.ps1",
            #"scripts/Invoke-Defrag.ps1",
            #"scripts/Reset-EmptySpace.ps1"
        ]
    }
    #provisioner "windows-restart" { # A restart before sysprep to settle the VM once more.
    #    pause_before    = "2m"
    #    restart_timeout = "1h"
    #}
    provisioner "powershell" {
        pause_before    = "7m"
        elevated_user = var.connection_username
        elevated_password = var.connection_password
        scripts = [
            "scripts/addusers.ps1",
            #"scripts/Remove-UpdateCache.ps1",
            #"scripts/Invoke-Defrag.ps1",
            #"scripts/Reset-EmptySpace.ps1"
        ]
    }
    provisioner "file" {
       source = "gpo/gpo.zip"
       destination = "c:/windows/temp/gpo.zip"
    }    
    #group policy file and script
    provisioner "powershell" {
        pause_before    = "1m"
        elevated_user = var.connection_username
        elevated_password = var.connection_password
        scripts = [
            "scripts/importgpo.ps1",
            
        ]
    }
    
}

