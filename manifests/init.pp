# == Class: riak2
#
# Full description of class riak2 here.
#
# === Parameters
#
# [*package_name*]
#   Name of riak package
#
# [*service_name*]
#   Service to manage
#
# [*version*]
#   Version to install
#
# [*node_name*]
#   Name of riak node, defaults to use riak@fqdn
#
# [*riak_config*]
#   Hashmap that will override any defaults for riak.conf file
#   see http://docs.basho.com/riak/latest/ops/advanced/configs/configuration-files/
#   for list of valid options
#
# [*restart_on_change*]
#   Bounce service on any config changes, should only use in development
#
# [*user*]
#   Username of riak service, used for file perms
#
# [*group*]
#   group of riak service, used for file perms
#
# [*platform_data_dir*]
#   Root dir of where data files are stored, will create dir
#
# [*platform_log_dir*]
#   Root dir of where log files are stored, will create dir
#
# [*disableboot*]
#   Disable riak service from being started at boottime
#
# [*manage_pam_limits*]
#
# [*manage_service_limits*]
#
# [*ulimit_nofiles*]
#   Open files limits
#
class riak2 (
  $package_name           = $::riak2::params::package_name,
  $service_name           = $::riak2::params::service_name,
  $version                = $::riak2::params::version,
  $node_name              = $::riak2::params::node_name,
  $riak_config            = $::riak2::params::config,
  $restart_on_change      = $::riak2::params::restart_on_change,
  $user                   = $::riak2::params::user,
  $group                  = $::riak2::params::group,
  $platform_data_dir      = $::riak2::params::platform_data_dir,
  $platform_log_dir       = $::riak2::params::platform_log_dir,
  $disableboot            = $::riak2::params::disableboot,
  $manage_pam_limits      = $::riak2::params::manage_pam_limits,
  $manage_service_limits  = $::riak2::params::manage_service_limits,
  $manage_service         = $::riak2::params::manage_service,
  $ulimit_nofiles         = $::riak2::params::ulimit_nofiles,

) inherits ::riak2::params {

  # validate parameters here
  # Couldn't figure out how to get these values in riak2::params properly?
  $config_dirs = {
    'platform_data_dir' => $platform_data_dir,
    'platform_log_dir'  => $platform_log_dir,
  }

  $config = merge($riak_config, $config_dirs)

  # merge hash of params::config and config
  validate_hash($config)

  class { '::riak2::install': } ->
  class { '::riak2::config': } ->
  class { '::riak2::service': } ->
  Class['::riak2']
}
