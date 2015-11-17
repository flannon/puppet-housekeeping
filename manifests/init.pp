class housekeeping {

  package { "bzip2-devel":
    ensure => "installed",
  }

  package { "gcc":
    ensure => "installed",
  }

  package { "gcc-c++":
    ensure => "installed",
  }

  package { "git":
    ensure => "installed",
  }

  package { "make":
    ensure => "installed",
  }

  package { "openssl-devel":
    ensure => "installed",
  }

  package { "patch":
    ensure => "installed",
  }

  package { "readline-devel":
    ensure => "installed",
  }

  package { "sqlite-devel":
    ensure => "installed",
  }

  package { "unzip":
    ensure => "installed",
  }

  package { "zip":
    ensure => "installed",
  }

  package { "zlib-devel":
    ensure => "installed",
  }

  file { '/home/root':
    ensure => link,
    target => '/root',
  }

  file { '/root/.bashrc':
    ensure => file,
    source => 'puppet:///modules/housekeeping/bashrc',
  }

  file { '/home/vagrant/.bashrc':
    ensure => file,
    source => 'puppet:///modules/housekeeping/bashrc',
    owner  => 'vagrant',
    group  => 'vagrant',
  }

}
