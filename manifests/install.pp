class ksplice::install inherits ksplice {

  case $::operatingsystem {

    'Debian', 'Ubuntu': {
      apt::source { 'ksplice':
        ensure     => $package_ensure,
        location   => 'http://www.ksplice.com/apt/',
        release    => "${::lsbdistcodename}",
        repos      => 'ksplice',
        key        => 'B6D4038E',
        key_source => 'https://www.ksplice.com/apt/ksplice-archive.asc',
      }

      package { 'uptrack':
        ensure => $package_ensure,
      }
    }

    'Fedora': {
      package { 'ksplice-uptrack-release':
        ensure   => $package_ensure,
        provider => 'rpm',
        source   => 'https://www.ksplice.com/yum/uptrack/fedora/ksplice-uptrack-release.noarch.rpm',
      }

      package { 'uptrack':
        ensure  => $package_ensure,
        require => Package['ksplice-uptrack-release'],
      }
    }

    'RedHat': {
      package { 'ksplice-uptrack-release':
        ensure   => $package_ensure,
        provider => 'rpm',
        source   => 'https://www.ksplice.com/yum/uptrack/rhel/ksplice-uptrack-release.noarch.rpm',
      }

      package { 'uptrack':
        ensure  => $package_ensure,
        require => Package['ksplice-uptrack-release'],
      }
    }

    'CentOS', 'SLC', 'Scientific', 'CloudLinux', 'PSBM', 'Ascendos': {
      package { 'ksplice-uptrack-release':
        ensure   => $package_ensure,
        provider => 'rpm',
        source   => 'https://www.ksplice.com/yum/uptrack/centos/ksplice-uptrack-release.noarch.rpm',
      }

      package { 'uptrack':
        ensure  => $package_ensure,
        require => Package['ksplice-uptrack-release'],
      }
    }

    'OEL', 'OVS', 'OracleLinux': {
      package { 'ksplice-uptrack-release':
        ensure   => $package_ensure,
        provider => 'rpm',
        source   => 'https://www.ksplice.com/yum/uptrack/ol/ksplice-uptrack-release.noarch.rpm',
      }

      package { 'uptrack':
        ensure  => $package_ensure,
        require => Package['ksplice-uptrack-release'],
      }
    }

    default: {
      fail("I don't know what to do with your operating system")
    }

  }

}
