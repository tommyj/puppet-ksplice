# == Class: ksplice
#
# Full description of class ksplice here.
#
# === Parameters
#
# Document parameters here.
#
# [*accesskey*]
#   The Ksplice access key provided to you by Oracle. Ksplice is free for
#   Fedora and Ubuntu users, and a free key may be obtained from
#   https://www.ksplice.com/uptrack/key for those distributions only. Use
#   on other distributions requires a subscription with Oracle.
#
# [*autoinstall*]
#   Uptrack runs in a cron job every few hours to check for and download
#   new updates. You can can configure this cron job to automatically
#   install new updates as they become available. Enable this option to
#   make the cron job automatically install new updates.
#
#   This does not automatically update the uptrack package itself;
#   to do that, set package_ensure => latest.
#
# [*https_proxy*]
#   Proxy to use when accessing the Uptrack server, of the form
#   [protocol://][username:password@]<host>[:port], where
#   * protocol is the protocol to connect to the proxy (http or https)
#   * the username and password are the authentication
#     information needed to use your proxy (if any).
#   * host and port are the hostname/ip address and port number used to
#     connect to the proxy
#
#   The proxy must support making HTTPS connections. If this is unset,
#   Uptrack will look for the https_proxy, HTTPS_PROXY, and http_proxy
#   environment variables in that order, and then finally look for a
#   proxy setting in the system-wide GConf database, if available and
#   enabled below.
#
#   You can also set this to "None" to force Uptrack not to use a proxy,
#   even if one is set in the environment.
#
# === Examples
#
#  class { ksplice:
#    accesskey   => 'mykey',
#    autoinstall => true,
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class ksplice (
  $accesskey       = $ksplice::params::accesskey,
  $autoinstall     = $ksplice::params::autoinstall,
  $config          = $ksplice::params::config,
  $config_template = $ksplice::params::config_template,
  $https_proxy     = $ksplice::params::https_proxy,
  $package_ensure  = $ksplice::params::package_ensure,
) inherits ksplice::params {

  validate_re($accesskey, ['^[0-9a-f]{64}$', ''])
  validate_bool($autoinstall)
  validate_absolute_path($config)
  validate_string($config_template)
  validate_string($https_proxy)
  validate_string($package_ensure)

  anchor { 'ksplice::begin': } ->
  class { 'ksplice::install': } ->
  class { 'ksplice::config': } ->
  anchor { 'ksplice::end': }

}
