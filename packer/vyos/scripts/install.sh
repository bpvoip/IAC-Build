#!/bin/bash
#the next 2 lines make the two passwords the same in the install-functions
#script which basically skips the change password call
#if you want a different password then update the word vyos on the next lines
sudo sed -i 's/pwd1="1"/pwd1="vyos"/' /opt/vyatta/sbin/install-functions
sudo sed -i 's/pwd2="2"/pwd2="vyos"/' /opt/vyatta/sbin/install-functions
printf "%s\n" "" "" "" "Yes" "" "" "y" | sudo -k -S /opt/vyatta/sbin/install-image
