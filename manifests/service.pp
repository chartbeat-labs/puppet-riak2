# == Class riak2::service
#
# This class is meant to be called from riak2.
# It ensure the service is running.
#
class riak2::service {

  $manage_service_ensure = $::riak2::manage_service ? {
    true    => 'running',
    false   => undef,
    default => undef,
  }

  service { $::riak2::service_name:
    ensure     => $manage_service_ensure,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
