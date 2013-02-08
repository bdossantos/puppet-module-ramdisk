define ramdisk(
  $ensure = 'present',
  $mount = 'mounted',
  $path = '/tmp/ramdisk',
  $fstype = 'tmpfs',
  $atboot = true,
  $size = '64M',
  $mode = '1777',
  $owner = 'root',
  $group = 'root',
) {
  if $::kernelmajversion <= 2.4 {
    fail('Unsuported kernel version')
  }

  if $ensure == 'present' {
    $real_ensure = 'directory'
  } else {
    $real_ensure = 'absent'
  }

  file { $path:
    ensure  => $real_ensure,
    mode    => $mode,
    owner   => $owner,
    group   => $group,
  } ->

  mount { $path:
    ensure  => $real_ensure ? {
      directory => mounted,
      default   => absent,
    },
    device  => $path,
    fstype  => $fstype,
    options => "size=${size},mode=${mode}",
    atboot  => $atboot,
  }
}