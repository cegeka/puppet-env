class env::system {

  file { '/etc/profile.d':
    ensure => directory,
  }

  file { '/etc/profile.d/hist_timestamp.sh':
    ensure  => present,
    content => "puppet:///modules/${module_name}/hist_timestamp.sh",
    require => File['/etc/profile.d'],
  }

}
