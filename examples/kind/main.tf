resource "kind_cluster" "cluster" {
  name            = "streamx"
  kubeconfig_path = "${path.module}/env/kubeconfig"
  wait_for_ready  = true

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"
    node {
      role = "control-plane"
      kubeadm_config_patches = [
        <<-KCP
        kind: InitConfiguration
        nodeRegistration:
          kubeletExtraArgs:
            node-labels: "ingress-ready=true"

        KCP
      ]

      extra_port_mappings {
        container_port = 80
        host_port      = 80
      }

      extra_port_mappings {
        container_port = 443
        host_port      = 443
      }
    }
  }
}

module "streamx_platform" {
  source = "../../" #TODO: change to deployed module source

  ingress_controller_nginx_values = [
    file("${path.module}/config/ingress-controller-nginx/values.yaml")
  ]
  cert_manager_lets_encrypt_issuer_acme_email          = var.cert_manager_lets_encrypt_issuer_acme_email
  streamx_operator_image_pull_secret_registry_email    = var.streamx_operator_image_pull_secret_registry_email
  streamx_operator_image_pull_secret_registry_password = var.streamx_operator_image_pull_secret_registry_password
}