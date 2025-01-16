resource "ovh_cloud_project_kube" "cluster" {
  service_name = var.ovh_service_name
  name         = var.ovh_cluster_name
  region       = var.ovh_cluster_region
  timeouts {
    create = "1h"
    update = "30m"
    delete = "30m"
  }
}

resource "ovh_cloud_project_kube_nodepool" "node_pool" {
  service_name                                 = var.ovh_service_name
  kube_id                                      = ovh_cloud_project_kube.cluster.id
  name                                         = "streamx"
  flavor_name                                  = "d2-8"
  desired_nodes                                = 5
  max_nodes                                    = 10
  min_nodes                                    = 5
  autoscale                                    = true
  autoscaling_scale_down_unneeded_time_seconds = 1200
}

resource "local_sensitive_file" "kubeconfig" {
  filename = "${path.module}/env/kubeconfig"
  content  = ovh_cloud_project_kube.cluster.kubeconfig
}

module "streamx_platform" {
  source = "../../" #TODO: change to deployed module source

  cert_manager_lets_encrypt_issuer_acme_email          = var.cert_manager_lets_encrypt_issuer_acme_email
  ingress_controller_nginx_timeout                     = 300
  streamx_operator_image_pull_secret_registry_email    = var.streamx_operator_image_pull_secret_registry_email
  streamx_operator_image_pull_secret_registry_password = var.streamx_operator_image_pull_secret_registry_password

  depends_on = [ovh_cloud_project_kube_nodepool.node_pool]
}