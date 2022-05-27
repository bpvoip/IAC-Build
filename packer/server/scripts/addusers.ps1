import-module ActiveDirectory
Get-Command New-ADUser -Syntax
New-ADUser -Name "Test User" -GivenName "Test" -Surname "User" -SamAccountName "Test.User" -userprincipalName "test.user@somedomain" -AccountPassword (ConvertTo-SecureString -AsPlainText "administrator password" -Force) -Enabled $true