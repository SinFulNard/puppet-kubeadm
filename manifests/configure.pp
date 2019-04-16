# == Class kubeadm::configure
#
# @summary This class is called from kubeadm::init to install the config file.
#
# == Parameters
#
# @param config Array for kubeadm to be deployed as YAML
#
# @param purge If set will make puppet remove stale config files.
#
class kubeadm::configure(
  $config,
  $purge   = true,
  $replace = true,
  $ensure  = 'present',
) {
  $config_yaml = $config.reduce('') |$result, $kind| { $result + $kind.to_yaml }

  file {$::kubeadm::config_dir:
    ensure  => directory,
    purge   => $purge,
    recurse => $purge,
  }
  -> file { 'kubeadm config.yaml':
    ensure    => $ensure,
    replace   => $replace,
    path      => "${::kubeadm::config_dir}/config.yaml",
    content   => $config_yaml,
    show_diff => false
  }
}
