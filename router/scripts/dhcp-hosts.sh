#!/bin/ash

#Assign static ip addresse by MAC address: dhcp-host=<MAC>,<HOSTNAME>,<IP>,<LEASE-TIMEOUT>

set -eu

sed -i '/^dhcp-host=/d' /etc/dnsmasq.conf
printf 'dhcp-host=08:00:27:00:00:20,debian1,192.168.1.20,infinite\n' >> /etc/dnsmasq.conf
/etc/init.d/dnsmasq restart
