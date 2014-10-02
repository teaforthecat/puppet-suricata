# == Class suricata::params
#
# This class is meant to be called from suricata
# It sets variables according to platform
#
class suricata::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'suricata'
      $service_name = 'suricata'
    }
    'RedHat', 'Amazon': {
      $package_name = 'suricata'
      $service_name = 'suricata'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
