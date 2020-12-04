# == Class: rsyslog::client
#
# Full description of class role here.
#
# === Parameters
#
# [*sample_parameter*]
# [*log_remote*]
# [*spool_size*]
# [*remote_type*]
# [*log_local*]
# [*log_auth_local*]
# [*custom_config*]
# [*custom_params*]
# [*server*]
# [*port*]
# [*ssl*]
# [*ssl_ca*]
# [*include_drupal*]
#
# === Variables
#
# === Examples
#
#  class { 'rsyslog::client': }
#
class rsyslog::client (
  $log_remote      = true,
  $spool_size      = '1g',
  $remote_type     = 'tcp',
  $log_local       = false,
  $log_auth_local  = false,
  $custom_config   = undef,
  $custom_params   = undef,
  $protocol_format = 'RSYSLOG_ForwardFormat',
  $server          = 'log',
  $port            = '514',
  $ssl             = false,
  $ssl_ca          = undef,
  $include_drupal  = true, # true for backwards compatibility reasons
) inherits rsyslog {

  if $custom_config {
    $content_real = template($custom_config)
  }
  else {
    $content_real = template("${module_name}/client.conf.erb")
  }

  rsyslog::snippet {'client':
    ensure  => present,
    content => $content_real,
  }

}
