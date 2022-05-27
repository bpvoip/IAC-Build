Add-WindowsFeature AD-Domain-Services -IncludeManagementTools
Install-ADDSForest -DomainName pickadomainname -DomainMode 7 -ForestMode 7 -InstallDns:$true -SafeModeAdministratorPassword (ConvertTo-SecureString -AsPlainText "administrator password" -Force)  -Confirm:$false

#Install-WindowsFeature AD-Certificate
#Add-WindowsFeature Adcs-Cert-Authority -IncludeManagementTools
#Install-AdcsCertificationAuthority -CAType EnterpriseRootCA

#Install-WindowsFeature -Name DHCP -IncludeManagementTools
## Create security groups:
#netsh dhcp add securitygroups
## Restart service so that the new security groups are used:
#Restart-Service dhcpserver
## Authenticate the DHCP in AD:
#Add-DhcpServerInDC -DnsName mydc.myTestDomain -IPAddress x.x.x.x
## Server manager will bother you about authenticating the DHCP in AD even though you've just done it, tell it to shut up:
#Set-ItemProperty -Path registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ServerManager\Roles\12 -Name ConfigurationState -Value 2
#
#
#Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
#Get-Command -Module ADDSDeployment
#Install-ADDSDomainController -InstallDns -Credential (Get-Credential area52.afnoapps.usaf.mil\administrator) -DomainName area52.afnoapps.usaf.mil -SafeModeAdministratorPassword (ConvertTo-SecureString -AsPlainText "P@ssw0rdP@ssw0rd" -Force)
