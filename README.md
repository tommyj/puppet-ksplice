#ksplice

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with ksplice](#setup)
    * [What ksplice affects](#what-ksplice-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with ksplice](#beginning-with-ksplice)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

##Overview

The ksplice module installs, configures, and manages the Ksplice Uptrack service.

##Module Description

The ksplice module handles installing, configuring, and running Ksplice Uptrack across a range of operating systems and distributions.

##Setup

###What ksplice affects

* uptrack package.
* uptrack configuration file.

###Beginning with ksplice

Ksplice requires an access key provided by Oracle. Ksplice is free for Fedora and Ubuntu users, and [a free key may be obtained](https://www.ksplice.com/uptrack/key) for those distributions only. Use on other distributions requires [a subscription with Oracle](https://www.ksplice.com/rhel-signup).

```puppet
class { '::ksplice':
  accesskey => 'mysupersecretkey',
}
```

##Usage

All interaction with the ksplice module can do be done through the main ksplice class.
This means you can simply toggle the options in `::ksplice` to have full functionality of the module.

###I just want Ksplice, what's the minimum I need?

```puppet
class { '::ksplice':
  accesskey => 'mysupersecretkey',
}
```

###I want Ksplice kernel updates to be installed automatically.

```puppet
class { '::ksplice':
  accesskey   => 'mysupersecretkey',
  autoinstall => true,
}
```

###I need to connect to the Internet through a proxy server.

```puppet
class { '::ksplice':
  accesskey   => 'mysupersecretkey',
  https_proxy => 'http://internal-proxy.example.com:3128/',
}
```

###Looks great!  But I'd like a different template; we need to do something unique here.

```puppet
class { '::ksplice':
  accesskey       => 'mysupersecretkey',
  config_template => 'different-module/custom.template.erb',
}
```

##Reference

###Classes

####Public Classes

* ksplice: Main class, includes all other classes.

####Private Classes

* ksplice::install: Handles the packages.
* ksplice::config: Handles the configuration file.

###Parameters

The following parameters are available in the ksplice module:

####`accesskey`

Sets the ksplice access key you received from Oracle.

####`autoinstall`

Set to true to allow ksplice to install kernel updates automatically.

####`config`

Sets the file that ksplice configuration is written into.

####`config_template`

Determines which template Puppet should use for the ksplice configuration.

####`https_proxy`

Sets the URL of a proxy server when one is required to reach the Internet. This must be a proxy server capable of reaching HTTPS URLs.
This can also be set to "None" to not use a proxy if one is set in the environment.

####`package_ensure`

Sets the ksplice package to be installed. Can be set to 'present', 'latest', or a specific version. 



##Limitations

This module has been built on and tested against Puppet 3.2 and higher.

The module is believed to work with:

* RedHat Enterprise Linux 5, 6, 7
* Fedora 19, 20
* Debian 6, 7
* CentOS 5, 6
* Ubuntu 10.04, 12.04, 14.04

Testing on platforms other than Fedora and Ubuntu has been light and cannot be guaranteed. 
