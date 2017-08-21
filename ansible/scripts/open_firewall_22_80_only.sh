#!/usr/bin/env bash

IPT=/sbin/iptables

$IPT -F

# policies

$IPT -P OUTPUT ACCEPT
$IPT -P INPUT DROP
$IPT -P FORWARD DROP
$IPT -N SERVICES

# allowed inputs

$IPT -A INPUT --in-interface lo -j ACCEPT
$IPT -A INPUT -j SERVICES

# allow responses

$IPT -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# allowed services

$IPT -A SERVICES -p tcp --dport 80 -j ACCEPT
$IPT -A SERVICES -p tcp --dport 22 -j ACCEPT
