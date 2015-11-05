# == Class: rsyslog::server
#
# This class configures rsyslog for a server role.
#
# === Parameters
#
# [*enable_tcp*]
# [*enable_udp*]
# [*enable_onefile*]
# [*server_dir*]
# [*high_precision_timestamps*]
# [*ssl*]
# [*ssl_ca*]
# [*ssl_cert*]
# [*ssl_key*]
#
# === Variables
#
# === Examples
#
#  Defaults
#
#  class { 'rsyslog::server': }
#
#  Create seperate directory per host
#
class rsyslog::server (
  $enable_tcp                = true,
  $enable_udp                = true,
  $enable_onefile            = false,
  $server_dir                = '/srv/log',
  $high_precision_timestamps = false,
  $ssl                       = false,
  $ssl_ca                    = undef,
  $ssl_cert                  = undef,
  $ssl_key                   = undef
) inherits rsyslog {

  rsyslog::snippet {'server':
    ensure  => present,
    content => template("${module_name}/server-default.conf.erb"),
  }
}
