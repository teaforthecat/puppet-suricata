# == Class suricata::install
#
class suricata::install {

  anchor{'suricata::install::repo-installed'}

  case $::osfamily {
   'redhat': {
   }
   'debian': {
     apt::ppa{ 'ppa:oisf/suricata-stable':
       notify => Anchor['suricata::install::repo-installed']
     }
   }
   default: {
   }
  }

  package { $suricata::package_name:
    ensure => present,
    require => Anchor['suricata::install::repo-installed']
  }
}
