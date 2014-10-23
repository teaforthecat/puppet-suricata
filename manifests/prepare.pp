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
# set_irq_affinity
# set InterruptThrottleRate to 3000? (in driver)
# load driver

# disable offloading
# ethtool -K eth3 tso off
# ethtool -K eth3 gro off
# ethtool -K eth3 lro off
# ethtool -K eth3 gso off
# ethtool -K eth3 rx off
# ethtool -K eth3 tx off
# ethtool -K eth3 sg off
# ethtool -K eth3 rxvlan off
# ethtool -K eth3 txvlan off

# load balance udp flows
# ethtool -N eth3 rx-flow-hash udp4 sdfn
# ethtool -N eth3 rx-flow-hash udp6 sdfn
# ethtool -n eth3 rx-flow-hash udp6
# ethtool -n eth3 rx-flow-hash udp4

# coalesce settings, http://pevma.blogspot.nl/2014/06/coalesce-parameters-and-rx-ring-size.html
# ethtool -C eth3 rx-usecs 0 rx-frames 0
# disable interrupt throth
# ethtool -C eth3 adaptive-rx off

# set max ring size
# ethtool -G eth3 rx 4096

# set promisc mode
# ifconfig eth3 promisc

# add kernel parameters
# sysctl -w net.core.netdev_max_backlog=250000
# sysctl -w net.core.rmem_max = 16777216
# sysctl -w net.core.rmem_max=16777216
# sysctl -w net.core.rmem_default=16777216
# sysctl -w net.core.optmem_max=16777216

# suricata metrics to watch
# http://pevma.blogspot.nl/2014/08/suricata-flows-flow-managers-and-effect.html
# http://blog.inliniac.net/2014/07/28/suricata-flow-logging/
# suricata config for perf
# http://pevma.blogspot.nl/2014/06/suricata-idps-getting-best-out-of.html
}
