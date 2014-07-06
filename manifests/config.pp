class ksplice::config inherits ksplice {

  $directory = dirname($config)
  file { $directory:
    ensure  => directory,
    owner   => 0,
    group   => 3,
    mode    => '0750',
    recurse => true,
  }

  file { $config:
    ensure  => file,
    owner   => 0,
    group   => 3,
    mode    => '0640',
    content => template($config_template),
  }

}
