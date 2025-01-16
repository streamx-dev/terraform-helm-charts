resource "azurerm_resource_group" "example" {
  name     = "streamx-example"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "cluster" {
  name                = "streamx-example"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "streax"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "node_pool" {
  name                  = "streamx"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.cluster.id
  vm_size               = "standard_d8pls_v6"
  node_count            = 5
  priority = "Spot"
}


resource "local_sensitive_file" "kubeconfig" {
  filename = "${path.module}/env/kubeconfig"
  content  = azurerm_kubernetes_cluster.cluster.kube_config_raw
}

module "streamx_platform" {
  source = "../../" #TODO: change to deployed module source

  cert_manager_lets_encrypt_issuer_acme_email          = var.cert_manager_lets_encrypt_issuer_acme_email
  streamx_operator_image_pull_secret_registry_email    = var.streamx_operator_image_pull_secret_registry_email
  streamx_operator_image_pull_secret_registry_password = var.streamx_operator_image_pull_secret_registry_password

  depends_on = [azurerm_kubernetes_cluster_node_pool.node_pool]
}