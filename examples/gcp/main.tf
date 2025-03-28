# Copyright 2025 Dynamic Solutions Sp. z o.o. sp.k.

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

resource "google_container_cluster" "cluster" {
  name                = var.gcp_cluster_name
  project             = var.gcp_project_id
  location            = var.gcp_cluster_location
  deletion_protection = false

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "node_pool" {
  name               = "streamx"
  project            = var.gcp_project_id
  cluster            = google_container_cluster.cluster.id
  initial_node_count = 1

  autoscaling {
    min_node_count = 1
    max_node_count = 10
  }

  node_config {

    oauth_scopes = [
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/devstorage.read_only"
    ]

    disk_size_gb = 200
    disk_type    = "pd-ssd"
    machine_type = "e2-standard-4"
  }

  depends_on = [google_container_cluster.cluster]
}

locals {
  kubeconfig = <<EOT
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: ${google_container_cluster.cluster.master_auth.0.cluster_ca_certificate}
    server: https://${google_container_cluster.cluster.endpoint}
  name: ${google_container_cluster.cluster.name}
contexts:
- context:
    cluster: ${google_container_cluster.cluster.name}
    user: ${google_container_cluster.cluster.name}
  name: ${google_container_cluster.cluster.name}
current-context: ${google_container_cluster.cluster.name}
kind: Config
preferences: {}
users:
- name: ${google_container_cluster.cluster.name}
  user:
    auth-provider:
      config:
        cmd-args: config config-helper --format=json
        cmd-path: gcloud
        expiry-key: '{.credential.token_expiry}'
        token-key: '{.credential.access_token}'
      name: gcp
EOT
}

resource "local_sensitive_file" "kubeconfig" {
  filename = "${path.module}/env/kubeconfig"
  content  = local.kubeconfig
}

module "streamx_platform" {
  source  = "streamx-dev/charts/helm"
  version = "0.0.4"

  prometheus_stack_grafana_admin_password              = var.grafana_admin_password
  grafana_admin_password                               = var.grafana_admin_password
  cert_manager_lets_encrypt_issuer_acme_email          = var.cert_manager_lets_encrypt_issuer_acme_email
  streamx_operator_image_pull_secret_registry_email    = var.streamx_operator_image_pull_secret_registry_email
  streamx_operator_image_pull_secret_registry_password = var.streamx_operator_image_pull_secret_registry_password
  streamx_operator_chart_repository_username           = "_json_key_base64"
  streamx_operator_chart_repository_password           = var.streamx_operator_image_pull_secret_registry_password

  depends_on = [google_container_node_pool.node_pool]
}
