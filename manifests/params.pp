# == Class riak2::params
#
# This class is meant to be called from riak2.
# It sets variables according to platform.
#
class riak2::params {

  $platform_data_dir = '/var/lib/riak'
  $platform_log_dir = '/var/log/riak'

  $config_dir = '/etc/riak'

  $config = {
    'anti_entropy'                                       => 'active',
    'anti_entropy.bloomfilter'                           => 'on',
    'anti_entropy.concurrency_limit'                     => '2',
    'anti_entropy.data_dir'                              => '$(platform_data_dir)/anti_entropy',
    'anti_entropy.max_open_files'                        => '20',
    'anti_entropy.throttle'                              => 'on',
    'anti_entropy.tree.build_limit.number'               => '1',
    'anti_entropy.tree.build_limit.per_timespan'         => '1h',
    'anti_entropy.tree.expiry'                           => '1w',
    'anti_entropy.trigger_interval'                      => '15s',
    'anti_entropy.use_background_manager'                => 'off',
    'anti_entropy.write_buffer_size'                     => '4MB',
    'background_manager'                                 => 'off',
    'bitcask.data_root'                                  => '$(platform_data_dir)/bitcask',
    'bitcask.expiry'                                     => 'off',
    'bitcask.expiry.grace_time'                          => '0',
    'bitcask.fold.max_age'                               => 'unlimited',
    'bitcask.fold.max_puts'                              => '0',
    'bitcask.hintfile_checksums'                         => 'strict',
    'bitcask.io_mode'                                    => 'erlang',
    'bitcask.max_file_size'                              => '2GB',
    'bitcask.max_merge_size'                             => '100GB',
    'bitcask.merge.policy'                               => 'always',
    'bitcask.merge.thresholds.dead_bytes'                => '128MB',
    'bitcask.merge.thresholds.fragmentation'             => '40',
    'bitcask.merge.thresholds.small_file'                => '10MB',
    'bitcask.merge.triggers.dead_bytes'                  => '512MB',
    'bitcask.merge.triggers.fragmentation'               => '60',
    'bitcask.merge.window.end'                           => '23',
    'bitcask.merge.window.start'                         => '0',
    'bitcask.merge_check_interval'                       => '3m',
    'bitcask.merge_check_jitter'                         => '30%',
    'bitcask.open_timeout'                               => '4s',
    'bitcask.sync.strategy'                              => 'none',
    'buckets.default.allow_mult'                         => 'false',
    'buckets.default.basic_quorum'                       => 'false',
    'buckets.default.dw'                                 => 'quorum',
    'buckets.default.last_write_wins'                    => 'false',
    'buckets.default.merge_strategy'                     => '1',
    'buckets.default.n_val'                              => '3',
    'buckets.default.notfound_ok'                        => 'true',
    'buckets.default.pr'                                 => '0',
    'buckets.default.pw'                                 => '0',
    'buckets.default.r'                                  => 'quorum',
    'buckets.default.rw'                                 => 'quorum',
    'buckets.default.w'                                  => 'quorum',
    'check_crl'                                          => 'on',
    'datatypes.compression_level'                        => '1',
    'distributed_cookie'                                 => 'riak',
    'dtrace'                                             => 'on',
    'erlang.K'                                           => 'on',
    'erlang.W'                                           => 'w',
    'erlang.async_threads'                               => '64',
    'erlang.crash_dump'                                  => '/var/log/riak/erl_crash.dump',
    'erlang.distribution_buffer_size'                    => '32MB',
    'erlang.fullsweep_after'                             => '0',
    'erlang.max_ets_tables'                              => '256000',
    'erlang.max_ports'                                   => '65536',
    'erlang.process_limit'                               => '256000',
    'erlang.schedulers.compaction_of_load'               => 'false',
    'erlang.schedulers.force_wakeup_interval'            => '500',
    'erlang.smp'                                         => 'enable',
    'handoff.inbound'                                    => 'on',
    'handoff.max_rejects'                                => '6',
    'handoff.outbound'                                   => 'on',
    'handoff.port'                                       => '8099',
    'handoff.use_background_manager'                     => 'off',
    'honor_cipher_order'                                 => 'on',
    'javascript.hook_pool_size'                          => '2',
    'javascript.map_pool_size'                           => '8',
    'javascript.maximum_heap_size'                       => '8MB',
    'javascript.maximum_stack_size'                      => '16MB',
    'javascript.reduce_pool_size'                        => '6',
    'leveldb.block.restart_interval'                     => '16',
    'leveldb.block.size'                                 => '4KB',
    'leveldb.block.size_steps'                           => '16',
    'leveldb.block_cache_threshold'                      => '32MB',
    'leveldb.bloomfilter'                                => 'on',
    'leveldb.compaction.trigger.tombstone_count'         => '1000',
    'leveldb.compression'                                => 'on',
    'leveldb.data_root'                                  => '$(platform_data_dir)/leveldb',
    'leveldb.fadvise_willneed'                           => 'false',
    'leveldb.limited_developer_mem'                      => 'off',
    'leveldb.maximum_memory.percent'                     => '70',
    'leveldb.sync_on_write'                              => 'off',
    'leveldb.threads'                                    => '71',
    'leveldb.tiered'                                     => 'off',
    'leveldb.verify_checksums'                           => 'on',
    'leveldb.verify_compaction'                          => 'on',
    'leveldb.write_buffer_size_max'                      => '60MB',
    'leveldb.write_buffer_size_min'                      => '30MB',
    'listener.http.internal'                             => "${::ipaddress}:8098",
    'listener.protobuf.internal'                         => "${::ipaddress}:8087",
    'log.console'                                        => 'file',
    'log.console.file'                                   => '$(platform_log_dir)/console.log',
    'log.console.level'                                  => 'info',
    'log.crash'                                          => 'on',
    'log.crash.file'                                     => '$(platform_log_dir)/crash.log',
    'log.crash.maximum_message_size'                     => '64KB',
    'log.crash.rotation'                                 => '$D0',
    'log.crash.rotation.keep'                            => '5',
    'log.crash.size'                                     => '10MB',
    'log.error.file'                                     => '$(platform_log_dir)/error.log',
    'log.error.messages_per_second'                      => '100',
    'log.error.redirect'                                 => 'on',
    'log.syslog'                                         => 'off',
    'log.syslog.facility'                                => 'daemon',
    'log.syslog.ident'                                   => 'riak',
    'log.syslog.level'                                   => 'info',
    'max_concurrent_requests'                            => '50000',
    'metadata_cache_size'                                => 'off',
    'nodename'                                           => "riak@${::fqdn}",
    'object.format'                                      => '1',
    'object.siblings.maximum'                            => '100',
    'object.siblings.warning_threshold'                  => '25',
    'object.size.maximum'                                => '50MB',
    'object.size.warning_threshold'                      => '5MB',
    'platform_bin_dir'                                   => '/usr/sbin',
    'platform_data_dir'                                  => $platform_data_dir,
    'platform_etc_dir'                                   => '/etc/riak',
    'platform_lib_dir'                                   => '/usr/lib/riak/lib',
    'platform_log_dir'                                   => $platform_log_dir,
    'protobuf.backlog'                                   => '128',
    'protobuf.nagle'                                     => 'off',
    'retry_put_coordinator_failure'                      => 'on',
    'riak_control'                                       => 'off',
    'riak_control.auth.mode'                             => 'off',
    'ring.state_dir'                                     => '$(platform_data_dir)/ring',
    'ring_size'                                          => '64',
    'runtime_health.thresholds.busy_ports'               => '2',
    'runtime_health.thresholds.busy_processes'           => '30',
    'runtime_health.triggers.distribution_port'          => 'on',
    'runtime_health.triggers.port'                       => 'on',
    'runtime_health.triggers.process.garbage_collection' => 'off',
    'runtime_health.triggers.process.heap_size'          => '160444000',
    'runtime_health.triggers.process.long_schedule'      => 'off',
    'sasl'                                               => 'off',
    'search'                                             => 'off',
    'search.anti_entropy.data_dir'                       => '$(platform_data_dir)/yz_anti_entropy',
    'search.root_dir'                                    => '$(platform_data_dir)/yz',
    'search.solr.jmx_port'                               => '8985',
    'search.solr.jvm_options'                            => '-d64 -Xms1g -Xmx1g -XX:+UseStringCache -XX:+UseCompressedOops',
    'search.solr.port'                                   => '8093',
    'search.solr.start_timeout'                          => '30s',
    'secure_referer_check'                               => 'on',
    'storage_backend'                                    => 'bitcask',
    'strong_consistency'                                 => 'off',
    'tls_protocols.sslv3'                                => 'off',
    'tls_protocols.tlsv1'                                => 'off',
    'tls_protocols.tlsv1.1'                              => 'off',
    'tls_protocols.tlsv1.2'                              => 'on',
    'transfer_limit'                                     => '2',
    'vnode_management_timer'                             => '10s',
  }


  # Bounce riak on config changes
  $restart_on_change = false

  $user = 'riak'
  $group = 'riak'

  $manage_pam_limits = true
  $manage_service_limits = true
  $ulimit_nofiles = 65536

  case $::osfamily {
    'Debian': {
      $package_name = 'riak'
      $service_name = 'riak'
    }
    'RedHat', 'Amazon': {
      $package_name = 'riak'
      $service_name = 'riak'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
