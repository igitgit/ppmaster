#node 'vcentos.net' {
#include tree.i686
#}
#node 'vcentos.net' {
#file { '/tmp/hello':
#content => "Hello, world\n"
#}
#}
#
#node 'ubuntu.net' {
#file { '/tmp/hello':
#content => "Hello, world\n"
#}
#}
#
#node 'ubuntu.net' {
#include tree.i686
#}
$packages = [ 'tree.i686',
		 'yakuake.i686' ]

#, 'yakuake.i686']

node 'puppet_client' {
service { $::operatingsystem? {
/Ubuntu|Debian/ => 'apache2',
default => 'httpd' }:
ensure => running,
}
}


node 'vcentos.net' inherits 'puppet_client' {
package { $packages: ensure => installed }
include 'memcached'
}


#node 'ubuntu.net' {
#}
service { 'apache2':
#ensure => running
}

node 'puppet_server' {
notify { "Only puppet server tag": }
}

node 'ubuntu.net' inherits 'puppet_server' {
if tagged ('puppet_server') {
notify { "Tagged as puppet server": }
}

file { '/tmp/hello':
content => "kkkkk",
notify => Service['apache2']
}

}


