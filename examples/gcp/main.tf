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
      "https://www.googleapis.com/auth/trace.append",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/devstorage.read_only"
    ]

    disk_size_gb = 200
    disk_type    = "pd-ssd"
    machine_type = "e2-standard-4"
  }
}

resource "local_sensitive_file" "kubeconfig" {
  filename = "${path.module}/env/kubeconfig"
  content  = <<EOT
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

module "streamx_platform" {
  source = "../../" #TODO: change to deployed module source

  cert_manager_lets_encrypt_issuer_acme_email          = var.cert_manager_lets_encrypt_issuer_acme_email
  streamx_operator_image_pull_secret_registry_email    = var.streamx_operator_image_pull_secret_registry_email
  streamx_operator_image_pull_secret_registry_password = var.streamx_operator_image_pull_secret_registry_password
}