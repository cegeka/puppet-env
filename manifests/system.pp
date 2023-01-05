class env::system {

  file { '/etc/profile.d':
    ensure => directory,
  }

  file { '/etc/profile.d/bash_hist.sh':
    ensure  => present,
    source  => "puppet:///modules/${module_name}/bash_hist.sh",
    require => File['/etc/profile.d'],
  }
  if (! $facts['running_vagrant']) {
    file { '/etc/profile.d/cegekaci.sh':
      ensure  => 'file',
      content => 'export CEGEKACI=$(grep "hinumber" /etc/facts | cut -d "=" -f 2)',
      mode    => '0644',
      require => File['/etc/profile.d'],
    }
  }

}
