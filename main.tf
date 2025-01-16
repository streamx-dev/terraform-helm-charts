module "ingress_controller_nginx" {
  count  = var.ingress_controller_nginx_enabled ? 1 : 0
  source = "./modules/ingress-controller-nginx"

  chart_name       = var.ingress_controller_nginx_chart_name
  chart_repository = var.ingress_controller_nginx_chart_repository
  chart_version    = var.ingress_controller_nginx_chart_version
  create_namespace = var.ingress_controller_nginx_create_namespace
  namespace        = var.ingress_controller_nginx_namespace
  release_name     = var.ingress_controller_nginx_release_name
  settings         = var.ingress_controller_nginx_settings
  timeout          = var.ingress_controller_nginx_timeout
  values           = coalescelist(var.ingress_controller_nginx_values, [file("${path.module}/default-configs/ingress-controller-nginx/values.yaml")])
}

module "cert_manager" {
  count  = var.cert_manager_enabled ? 1 : 0
  source = "./modules/cert-manager"

  chart_name       = var.cert_manager_chart_name
  chart_repository = var.cert_manager_chart_repository
  chart_version    = var.cert_manager_chart_version
  create_namespace = var.cert_manager_create_namespace
  namespace        = var.cert_manager_namespace
  release_name     = var.cert_manager_release_name
  settings         = var.cert_manager_settings
  timeout          = var.cert_manager_timeout
  values           = coalescelist(var.cert_manager_values, [file("${path.module}/default-configs/cert-manager/values.yaml")])
}

module "cert_manager_lets_encrypt_issuer" {
  count  = var.cert_manager_enabled && var.cert_manager_lets_encrypt_issuer_enabled ? 1 : 0
  source = "./modules/cert-manager-issuer-lets-encrypt"

  name                    = var.cert_manager_lets_encrypt_issuer_name
  namespace               = var.cert_manager_lets_encrypt_issuer_namespace
  prod_letsencrypt_server = var.cert_manager_lets_encrypt_issuer_prod_letsencrypt_server
  issuer_acme_email       = var.cert_manager_lets_encrypt_issuer_acme_email
  issuer_ingress_class    = var.cert_manager_lets_encrypt_issuer_ingress_class

  depends_on = [module.cert_manager]
}

module "pulsar_kaap" {
  count  = var.pulsar_kaap_enabled ? 1 : 0
  source = "./modules/pulsar-kaap"

  chart_name       = var.pulsar_kaap_chart_name
  chart_repository = var.pulsar_kaap_chart_repository
  chart_version    = var.pulsar_kaap_chart_version
  create_namespace = var.pulsar_kaap_create_namespace
  namespace        = var.pulsar_kaap_namespace
  release_name     = var.pulsar_kaap_release_name
  settings         = var.pulsar_kaap_settings
  timeout          = var.pulsar_kaap_timeout
  values           = coalescelist(var.pulsar_kaap_values, [file("${path.module}/default-configs/pulsar-kaap/values.yaml")])
}

locals {
  streamx_operator_namespace                           = var.streamx_operator_create_namespace ? kubernetes_namespace.streamx_operator[0].metadata[0].name : var.streamx_operator_namespace
  streamx_operator_image_pull_secret_name              = var.streamx_operator_image_pull_secret_enabled ? module.streamx_operator_image_pull_secret[0].secret_name : var.streamx_operator_image_pull_secret_name
  streamx_operator_messaging_pulsar_client_service_url = var.pulsar_kaap_enabled ? module.pulsar_kaap[0].client_service_url : var.streamx_operator_messaging_pulsar_client_service_url
  streamx_operator_messaging_pulsar_admin_service_url  = var.pulsar_kaap_enabled ? module.pulsar_kaap[0].admin_service_url : var.streamx_operator_messaging_pulsar_admin_service_url
}

resource "kubernetes_namespace" "streamx_operator" {
  count = var.streamx_operator_enabled && var.streamx_operator_create_namespace ? 1 : 0

  metadata {
    name = var.streamx_operator_namespace
  }
}

module "streamx_operator_image_pull_secret" {
  count  = var.streamx_operator_enabled && var.streamx_operator_image_pull_secret_enabled ? 1 : 0
  source = "./modules/docker-config-secret"

  name              = var.streamx_operator_image_pull_secret_name
  namespace         = local.streamx_operator_namespace
  registry_email    = var.streamx_operator_image_pull_secret_registry_email
  registry_password = var.streamx_operator_image_pull_secret_registry_password
  registry_server   = var.streamx_operator_image_pull_secret_registry_server
  registry_username = var.streamx_operator_image_pull_secret_registry_username
}

module "streamx_operator" {
  count  = var.streamx_operator_enabled ? 1 : 0
  source = "./modules/streamx-operator"

  chart_name                = var.streamx_operator_chart_name
  chart_repository          = var.streamx_operator_chart_repository
  chart_repository_username = var.streamx_operator_chart_repository_username
  chart_repository_password = var.streamx_operator_chart_repository_password
  chart_version             = var.streamx_operator_chart_version
  create_namespace          = var.streamx_operator_create_namespace
  namespace                 = local.streamx_operator_namespace
  release_name              = var.streamx_operator_release_name
  settings                  = var.streamx_operator_settings
  timeout                   = var.streamx_operator_timeout
  values                    = coalescelist(var.streamx_operator_values, [
    yamlencode({
      imagePullSecrets = local.streamx_operator_image_pull_secret_name == null ? [] : [
        { name = local.streamx_operator_image_pull_secret_name }
      ]
      messaging = {
        pulsar = {
          initImage : var.streamx_operator_messaging_pulsar_init_image
          clientServiceUrl = local.streamx_operator_messaging_pulsar_client_service_url
          adminServiceUrl  = local.streamx_operator_messaging_pulsar_admin_service_url
        }
      }
      monitoring = {
        traces = {
          enabled  = var.streamx_operator_monitoring_traces_enabled
          endpoint = var.streamx_operator_monitoring_traces_endpoint
        }
      }
    })
  ])
}
