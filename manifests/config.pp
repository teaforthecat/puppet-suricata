# == Class suricata::config
#
# This class is called from suricata
#
class suricata::config {
  file{ 'logdir':
    ensure => directory,
    path   => '/var/log/suricata',
  } ~>

  file{ 'classification.config':
    path    => '/etc/suricata/classification.config',
    content => template('suricata/classification.config.erb'),
  } ~>

  file{ 'reference.config':
    path    => '/etc/suricata/reference.config',
    content => template('suricata/reference.config.erb'),
  } ~>

  file{ 'suricata-default':
    path    => '/etc/default/suricata',
    content => template('suricata/suricata-default.erb'),
  } ~>

  file{ 'suricata.yaml':
    path    => '/etc/suricata/suricata.yaml',
    content => template('suricata/suricata.yaml.erb'),
  }
  
}
