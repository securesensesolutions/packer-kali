#!/bin/sh -eux

# Disable automatic udev rules for network interfaces in Ubuntu,
# source: http://6.ptmc.org/164/
rm -f /etc/udev/rules.d/70-persistent-net.rules;
mkdir -p /etc/udev/rules.d/70-persistent-net.rules;
rm -f /lib/udev/rules.d/75-persistent-net-generator.rules;
rm -rf /dev/.udev/ /var/lib/dhcp/*;

# Adding a 2 sec delay to the interface up, to make the dhclient happy
echo "pre-up sleep 2" >> /etc/network/interfaces
# Set DHCP for ens5
echo "auto ens5" >> /etc/network/interfaces
echo "iface ens5 inet dhcp" >> /etc/network/interfaces
# Set DHCP for ens3
echo "auto ens3" >> /etc/network/interfaces
echo "iface ens3 inet dhcp" >> /etc/network/interfaces
