#!/bin/bash
# Flush existing rules
iptables -F
iptables -X
iptables -Z

# Allow established and related connections
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# DNS
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p udp --sport 53 -j ACCEPT

# Loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Incoming connections
iptables -A INPUT -p tcp -m multiport --dports 22,80,443,6443,9100 -j ACCEPT
iptables -A OUTPUT -p tcp -m multiport --sports 22,80,443,6443,9100 -j ACCEPT

# Outgoing connections
iptables -A OUTPUT -p tcp -m multiport --dports 80,443,6443 -j ACCEPT
iptables -A INPUT -p tcp -m multiport --sports 80,443,6443 -j ACCEPT

# Apply Docker Chains
systemctl restart docker

# Default policies
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# Save rules
netfilter-persistent save