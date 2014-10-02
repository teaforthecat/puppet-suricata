# == Class suricata::install
#
class suricata::install {

  apt::ppa{ 'ppa:oisf/suricata-stable': } ~>

  package { $suricata::package_name:
    ensure => present,
  }
}
