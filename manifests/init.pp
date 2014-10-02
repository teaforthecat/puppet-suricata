# == Class: suricata
#
# Full description of class suricata here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class suricata (
  $package_name = $suricata::params::package_name,
  $service_name = $suricata::params::service_name,
) inherits suricata::params {

  # validate parameters here

  class { 'suricata::install': } ->
  class { 'suricata::config': } ~>
  class { 'suricata::service': } ->
  Class['suricata']
}
