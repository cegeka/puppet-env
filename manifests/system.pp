class env::system {

  file { '/etc/profile.d':
    ensure => directory,
  }

  file { '/etc/profile.d/bash_hist.sh':
    ensure  => present,
    source  => "puppet:///modules/${module_name}/bash_hist.sh",
    require => File['/etc/profile.d'],
  }

}
