#!/bin/bash

# Get network interfaces and their details
interfaces=$(ip link show)

# Get IP addresses of all interfaces
ip_addresses=$(ip addr show | awk  '/inet / {print$2}' | cut -d '/' -f 1)

# Get routing table
routing_table=$(ip route)

# Get DNS configuration
dns_configuration=$(cat /etc/resolv.conf)

# Get active internet connections
active_connections=$(netstat -tuln)

# Output internet information
echo "Network Interfaces:"
echo "$interfaces"
echo "IP Addresses:"
echo "$ip_addresses"
echo "Routing Table:"
echo "$routing_table"
echo "DNS Configuration:"
echo "$dns_configuration"
echo "Active Internet Connections:"
echo "$active_connections"

