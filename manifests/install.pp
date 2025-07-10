# == Class: rsyslog::install
#
# This class makes sure that the required packages are installed
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'rsyslog::install': }
#
class rsyslog::install (
  Boolean $ssl,
) {
  if $rsyslog::rsyslog_package_name != false {
    package { $rsyslog::rsyslog_package_name:
      ensure => $rsyslog::package_status,
    }
  }

  if $rsyslog::relp_package_name != false {
    package { $rsyslog::relp_package_name:
      ensure => $rsyslog::package_status
    }
  }

  if $rsyslog::ssl != false {
    package { 'rsyslog-gnutls':
      ensure => $rsyslog::package_status
    }
 }

}
