# Puppet ramdisk module

Configure [ramdisk](https://wiki.archlinux.org/index.php/Ramdisk) with Puppet.

Tested on Debian GNU/Linux 6.0 Squeeze with Puppet 2.7.
Patches for other operating systems welcome.

## Installation

Clone this repository to ramdisk directory under your modules directory :

```bash
git clone https://github.com/bdossantos/puppet-module-ramdisk.git modules/ramdisk
```

As git submodule :

```bash
git submodule add https://github.com/bdossantos/puppet-module-ramdisk.git modules/ramdisk
git submodule update --init
```

## Example

Create ramdisk for PHP sessions :

```puppet
ramdisk { 'php_sessions':
  ensure  => present,
  path    => '/var/lib/php5',
  atboot  => true,
  size    => '256M',
  mode    => '1733',
  owner   => 'root',
  group   => 'root',
}
```