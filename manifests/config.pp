# == Class riak2::config
#
# This class is called from riak2 for service config.
#
class riak2::config {

  File {
    owner => $riak2::user,
    group => $riak2::group,
  }

  $notify_service = $riak2::restart_on_change ? {
    true  => [Riak2::Service[$riak2::service_name], Exec['validate_config']],
    false => Exec['validate_config'],
  }


  # Merge overridden config values with defaults
  # right most hash wins on duplicate keys
  $riak_config = merge($riak2::params::config, $riak2::config)

  # Drop conf in place
  file { "${riak2::config_dir}/riak.conf":
    ensure  => present,
    content => template("${module_name}/riak.conf.erb"),
    notify  => $notify_service,
  }

  exec { 'validate_config':
    command     => '/usr/sbin/riak chkconfig',
    refreshonly => true,
  }

  # Ensure data and log dir created with proper perms
  file { $riak2::platform_data_dir:
    ensure => 'directory',
    mode   => '0640'
  }

  file { $riak2::platform_log_dir:
    ensure => 'directory',
    mode   => '0644'
  }

  if $riak2::manage_pam_limits {
    file { '/etc/security/limits.d/riak.conf':
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template("${module_name}/limits.conf.erb")
    }
  }

  if $riak2::manage_service_limits {
    file { '/etc/default/riak':
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => "ulimit -n ${riak2::ulimit_nofiles}",
    }
  }



}
