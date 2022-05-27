/* 
Specify any declared variables from the file of, variables.pkr.hcl, to override default values.
Example of default value of var cpu_name is 2 cores. We override that with 4 cores below.
*/

vcenter_username        = "vcenter username"
vcenter_password        = "vcenter password"

os_username             = "connection username"
os_password_workstation = "connection password"

vcenter_server          = "vcenter ip/dns"
#vcenter_cluster         = "cluster-lab"
vcenter_datacenter      = "Datacenter1"
vcenter_host            = "vsphere managed host"
vcenter_datastore       = "datastore1"
vcenter_folder          = "Templates"

vm_name                 = "win10"
vm_network              = "VM Network"
vm_guest_os_type        = "windows9_64Guest" # Refer to https://code.vmware.com/apis/704/vsphere/vim.vm.GuestOsDescriptor.GuestOsIdentifier.html for guest OS types.
vm_version              = "13" # Refer to https://kb.vmware.com/s/article/1003746 for specific VM versions.

os_iso_path             = "[datastore1] ISO/win10.iso"
vmtools_iso_path        = "[datastore1] ISO/VMware-tools.iso"

cpu_num                 = 2
ram                     = 8192
disk_size               = 81920