# == Class: keys
#
# Full description of class keys here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'keys':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
##
## Thanks to R.Shestakov for the known_hosts solution
## https://rshestakov.wordpress.com/2014/01/26/how-to-make-vagrant-and-puppet-to-clone-private-github-repo/
##
#
class housekeeping::known_hosts ( $username = 'root')  {
    $groups = $username
    $server_list = ['github.com']

    file { '/root/.ssh' :
      ensure => directory,
      group  => $group,
      owner  => $username,
      mode   => 0600,
    }

    file { '/root/.ssh/known_hosts' :
      ensure  => file,
      group   => $groupname,
      owner   => $username,
      mode    => 0600,
      require => File [ '/root/.ssh'],
    }

    file { '/tmp/known_hosts.sh' :
      ensure => present,
      mode   => '0755',
      source => 'puppet:///modules/housekeeping/known_hosts.sh',
    }

    exec { 'add_known_hosts' :
      command  => '/tmp/known_hosts.sh',
      path     => '/sbin:/usr/bin:/usr/local/bin:/bin/',
      provider => shell,
      user     => 'root',
      require  => File [ '/root/.ssh/known_hosts', '/tmp/known_hosts.sh'],
      }

}
