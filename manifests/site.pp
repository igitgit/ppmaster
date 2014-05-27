service { "httpd":
ensure => running,
enable => true,
pattern => 'httpd',
}

service { "puppet":
ensure => running,
enable => true,
pattern => 'puppet',
}
