# == Class suricata::prepare
#
class suricata::prepare {

# prepare $suricata::monitor_interface
# install ethtool
  package { 'ethtool':
    ensure => installed,
  }
# service irqbalance stop
  service { 'irqbalance':
    ensure => stopped,
    enable => false,
  }
# disable offloading
# generic-receive-offload
  exec { 'disable_gro':
    command => "/sbin/ethtool -K $suricata::monitor_interface gro off",
    unless  => "/sbin/ethtool -k $suricata::monitor_interface | grep 'generic-receive-offload: off'"
  }
# rx-vlan-offload
  exec { 'disable_rxvlan':
    command => "/sbin/ethtool -K $suricata::monitor_interface rxvlan off",
    unless  => "/sbin/ethtool -k $suricata::monitor_interface | grep 'rx-vlan-offload: off'"
  }
# generic-segmentation-offload
  exec { 'disable_gso':
    command => "/sbin/ethtool -K $suricata::monitor_interface gso off",
    unless  => "/sbin/ethtool -k $suricata::monitor_interface | grep 'generic-segmentation-offload: off'"
  }
# tcp-segmentation-offload
  exec { 'disable_sg':
    command => "/sbin/ethtool -K $suricata::monitor_interface sg off",
    unless  => "/sbin/ethtool -k $suricata::monitor_interface | grep 'tcp-segmentation-offload: off'"
  }
# rx-checksumming
  exec { 'disable_rx':
    command => "/sbin/ethtool -K $suricata::monitor_interface rx off",
    unless  => "/sbin/ethtool -k $suricata::monitor_interface | grep 'rx-checksumming: off'"
  }
# set promisc mode
  exec { 'set_promisc':
    command => "/sbin/ifconfig $suricata::monitor_interface promisc",
    unless  => "/sbin/ifconfig $suricata::monitor_interface | grep 'PROMISC'"
  }


# set max ring size
# ethtool -G eth3 rx 4096

# add kernel parameters
# sysctl -w net.core.netdev_max_backlog=250000
# sysctl -w net.core.rmem_max = 16777216
# sysctl -w net.core.rmem_max=16777216
# sysctl -w net.core.rmem_default=16777216
# sysctl -w net.core.optmem_max=16777216

# suricata metrics to watch
# http://pevma.blogspot.nl/2014/08/suricata-flows-flow-managers-and-effect.html
}
