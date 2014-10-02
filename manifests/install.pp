# == Class suricata::install
#
class suricata::install {

  package { $suricata::package_name:
    ensure => present,
  }
}
