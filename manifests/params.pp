# == Class kubeadm::params
#
# @summary This class is meant to be called from kubeadm
# It sets variables according to platform
#
class kubeadm::params {
  $config_dir             = '/etc/kubeadm'
  $config                 = []
  $kubectl_package_name   = 'kubelet'
  $kubelet_package_name   = 'kubectl'
  $kubectl_package_ensure = 'latest'
  $kubelet_package_ensure = 'latest'
  $kubelet_service_enable = true
  $kubelet_service_ensure = 'running'
  $kubelet_service_name   = 'kubelet'
  $manage_kubectl         = true
  $manage_kubelet         = true
  $manage_repos           = true
  $master                 = false
  $package_ensure         = 'latest'
  $package_name           = 'kubeadm'
  $pretty_config          = true
  $pretty_config_indent   = 4
  $purge_config_dir       = true
  $replace_kubeadm_config = true
  $kubeadm_config_ensure  = 'present'
  $refresh_controlplane   = true
}
