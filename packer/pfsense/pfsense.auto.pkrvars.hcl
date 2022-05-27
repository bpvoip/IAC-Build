vcenter_server = "vcenter ip/dns"
vcenter_username = "vcenter username"
vcenter_cluster = "Cluster-01"
vcenter_datacenter = "Datacenter1"
vcenter_host = "vcenter managed host"
vcenter_datastore = "datastore1"
vcenter_folder = "Templates"
vcenter_password = "vcenter password"
vm_network = "VM Network1"
vm_network1 = "VM Network2"
vm_network2 = "VM Network3"
vm_network3 = "VM Network4"
os_version = "8"
os_family = "linux"
guest_os_type = "otherlinux64guest"
os_iso_path = "[datastore1] ISO/pfSense.iso"
#os_iso_url = "http://mirror.mobap.edu/centos/8.2.2004/isos/x86_64/CentOS-8.2.2004-x86_64-minimal.iso"
iso_checksum = "47AB14778C823ACAE2EE6D365D76A9AED3F95BB8D0ADD23A06536B58BB5293C0"
root_disk_size = 24000
connection_username = "connection username"
connection_password = "connection password"
boot_command = [
  #"<tab> text ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/pfsense-ks.cfg<enter><wait>"
  "<enter><wait2s><enter><wait2s><enter><wait2s><enter><wait2s>",
  "<enter><wait2s><enter><wait2s><spacebar><wait2s><enter><wait2s>",
  "y<wait45s>n<wait2s><enter><wait60s>n<enter><wait15s>em0<enter><wait10s><enter><wait5s>y<enter><wait1m>",
  "14<enter><wait>y<enter><wait>",
  "8<enter><wait>",
  "curl http://{{ .HTTPIP }}:{{ .HTTPPort }}/open-vm-tools-nox11.pkg -o ./open-vm-tools-nox11.pkg<enter><wait5s>",
  "curl http://{{ .HTTPIP }}:{{ .HTTPPort }}/libdnet.pkg -o ./libdnet.pkg<enter><wait5s>",
  "curl http://{{ .HTTPIP }}:{{ .HTTPPort }}/libmspack.pkg -o ./libmspack.pkg<enter><wait5s>",
  "pkg install libdnet.pkg<enter><wait5s>",
  "y<enter><wait5s>",
  "pkg install libmspack.pkg<enter><wait5s>",
  "y<enter><wait5s>",
  "pkg install open-vm-tools-nox11.pkg<enter><wait5s>",
  "y<enter><wait5s>",
  "/usr/local/etc/rc.d/vmware-guestd start<enter><wait5s>",
  "<wait5s>"
]
http_ip = "user workstation ip"
http_directory    = "boot_config"