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

module "ingress_controller_apisix" {
  count  = var.ingress_controller_apisix_enabled ? 1 : 0
  source = "./modules/ingress-controller-apisix"

  chart_name       = var.ingress_controller_apisix_chart_name
  chart_repository = var.ingress_controller_apisix_chart_repository
  chart_version    = var.ingress_controller_apisix_chart_version
  create_namespace = var.ingress_controller_apisix_create_namespace
  namespace        = var.ingress_controller_apisix_namespace
  release_name     = var.ingress_controller_apisix_release_name
  settings         = var.ingress_controller_apisix_settings
  timeout          = var.ingress_controller_apisix_timeout
  values           = coalescelist(var.ingress_controller_apisix_values, [
    file("${path.module}/default-configs/ingress-controller-apisix/values.yaml")
  ])
}

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
  values           = coalescelist(var.ingress_controller_nginx_values, [
    file("${path.module}/default-configs/ingress-controller-nginx/values.yaml")
  ])
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
  values           = coalescelist(var.cert_manager_values, [
    file("${path.module}/default-configs/cert-manager/values.yaml")
  ])
}

module "cert_manager_lets_encrypt_issuer" {
  count  = var.cert_manager_lets_encrypt_issuer_enabled ? 1 : 0
  source = "./modules/cert-manager-issuer-lets-encrypt"

  name                    = var.cert_manager_lets_encrypt_issuer_name
  namespace               = var.cert_manager_lets_encrypt_issuer_namespace
  prod_letsencrypt_server = var.cert_manager_lets_encrypt_issuer_prod_letsencrypt_server
  issuer_acme_email       = var.cert_manager_lets_encrypt_issuer_acme_email
  issuer_ingress_class    = var.cert_manager_lets_encrypt_issuer_ingress_class

  depends_on = [module.cert_manager]
}

resource "random_password" "minio_secret_access_key" {
  count   = var.minio_enabled && var.minio_create_namespace ? 1 : 0
  # Removed special characters to avoid issues with tempo configuration in tempo/config.yaml
  special = false
  length  = 16
}

resource "kubernetes_namespace" "minio" {
  count = var.minio_enabled && var.minio_create_namespace ? 1 : 0

  metadata {
    name = var.minio_namespace
  }
}

locals {
  minio_namespace = var.minio_enabled && var.minio_create_namespace ? kubernetes_namespace.minio[0].metadata[0].name : var.minio_namespace
}

resource "kubernetes_secret_v1" "minio_s3_access_keys" {
  count = var.minio_enabled ? 1 : 0

  metadata {
    name      = "s3-access-keys"
    namespace = local.minio_namespace
  }

  data = {
    accessKeyId : "minio-user"
    secretAccessKey : random_password.minio_secret_access_key[0].result
  }
}

module "minio" {
  count  = var.minio_enabled ? 1 : 0
  source = "./modules/minio"

  chart_name       = var.minio_chart_name
  chart_repository = var.minio_chart_repository
  chart_version    = var.minio_chart_version
  create_namespace = var.minio_create_namespace
  namespace        = local.minio_namespace
  release_name     = var.minio_release_name
  settings         = var.minio_settings
  timeout          = var.minio_timeout
  values           = coalescelist(var.minio_values, [
    file("${path.module}/default-configs/minio/values.yaml")
  ])

  depends_on = [kubernetes_secret_v1.minio_s3_access_keys]
}

resource "kubernetes_namespace" "loki" {
  count = var.loki_enabled && var.loki_create_namespace ? 1 : 0

  metadata {
    name = var.loki_namespace
  }
}

locals {
  loki_namespace = var.loki_enabled && var.loki_create_namespace ? kubernetes_namespace.loki[0].metadata[0].name : var.loki_namespace
}

resource "kubernetes_secret_v1" "loki_s3_access_keys" {
  count = var.loki_enabled && var.minio_enabled ? 1 : 0

  metadata {
    name      = "s3-access-keys"
    namespace = local.loki_namespace
  }

  data = {
    accessKeyId : "minio-user"
    secretAccessKey : random_password.minio_secret_access_key[0].result
  }
}

module "loki" {
  count  = var.loki_enabled ? 1 : 0
  source = "./modules/monitoring-loki"

  chart_name       = var.loki_chart_name
  chart_repository = var.loki_chart_repository
  chart_version    = var.loki_chart_version
  create_namespace = var.loki_create_namespace
  namespace        = local.loki_namespace
  release_name     = var.loki_release_name
  settings         = var.loki_settings
  timeout          = var.loki_timeout
  values           = coalescelist(var.loki_values, [
    file("${path.module}/default-configs/loki/values.yaml")
  ])

  depends_on = [module.minio, kubernetes_secret_v1.loki_s3_access_keys]
}

resource "kubernetes_namespace" "tempo" {
  count = var.tempo_enabled && var.tempo_create_namespace ? 1 : 0

  metadata {
    name = var.tempo_namespace
  }
}

locals {
  tempo_namespace = var.tempo_enabled && var.tempo_create_namespace ? kubernetes_namespace.tempo[0].metadata[0].name : var.tempo_namespace
}

resource "kubernetes_secret_v1" "tempo_s3_access_keys" {
  count = var.tempo_enabled && var.minio_enabled ? 1 : 0

  metadata {
    name      = "s3-access-keys"
    namespace = local.tempo_namespace
  }

  data = {
    accessKeyId : "minio-user"
    secretAccessKey : random_password.minio_secret_access_key[0].result
  }
}

module "tempo" {
  count  = var.tempo_enabled ? 1 : 0
  source = "./modules/monitoring-tempo"

  chart_name       = var.tempo_chart_name
  chart_repository = var.tempo_chart_repository
  chart_version    = var.tempo_chart_version
  create_namespace = var.tempo_create_namespace
  namespace        = local.tempo_namespace
  release_name     = var.tempo_release_name
  settings         = var.tempo_settings
  timeout          = var.tempo_timeout
  values           = coalescelist(var.tempo_values, [
    file("${path.module}/default-configs/tempo/values.yaml")
  ])

  depends_on = [module.minio, kubernetes_secret_v1.tempo_s3_access_keys]
}

module "opentelemetry_operator" {
  count  = var.opentelemetry_operator_enabled ? 1 : 0
  source = "./modules/monitoring-opentelemetry-operator"

  chart_name       = var.opentelemetry_operator_chart_name
  chart_repository = var.opentelemetry_operator_chart_repository
  chart_version    = var.opentelemetry_operator_chart_version
  create_namespace = var.opentelemetry_operator_create_namespace
  namespace        = var.opentelemetry_operator_namespace
  release_name     = var.opentelemetry_operator_release_name
  settings         = var.opentelemetry_operator_settings
  timeout          = var.opentelemetry_operator_timeout
  values           = coalescelist(var.opentelemetry_operator_values, [
    file("${path.module}/default-configs/opentelemetry-operator/values.yaml")
  ])
}

locals {
  logs_otlphttp_endpoint    = var.loki_enabled ? module.loki[0].loki_otlp_endpoint : var.opentelemetry_collector_deamonset_logs_otlphttp_endpoint
  traces_otlp_endpoint      = var.tempo_enabled ? module.tempo[0].tempo_otlp_endpoint : var.opentelemetry_collector_deamonset_traces_otlp_endpoint
  metrics_otlphttp_endpoint = var.prometheus_stack_enabled ? module.prometheus_stack[0].metrics_otlp_endpoint : var.opentelemetry_collector_deamonset_metrics_otlphttp_endpoint
}

module "opentelemetry_collector_deamonset" {
  count  = var.opentelemetry_collector_deamonset_enabled ? 1 : 0
  source = "./modules/monitoring-opentelemetry-collector"

  chart_name       = var.opentelemetry_collector_deamonset_chart_name
  chart_repository = var.opentelemetry_collector_deamonset_chart_repository
  chart_version    = var.opentelemetry_collector_deamonset_chart_version
  create_namespace = var.opentelemetry_collector_deamonset_create_namespace
  namespace        = var.opentelemetry_collector_deamonset_namespace
  release_name     = var.opentelemetry_collector_deamonset_release_name
  settings         = var.opentelemetry_collector_deamonset_settings
  timeout          = var.opentelemetry_collector_deamonset_timeout
  values           = coalescelist(var.opentelemetry_collector_deamonset_values, [
    templatefile("${path.module}/default-configs/opentelemetry-collector/deamonset-values.tftpl.yaml", {
      logs_otlphttp_endpoint    = "http://${local.logs_otlphttp_endpoint}"
      traces_otlp_endpoint      = local.traces_otlp_endpoint
      metrics_otlphttp_endpoint = "http://${local.metrics_otlphttp_endpoint}"
    })
  ])

  depends_on = [module.opentelemetry_operator]
}

resource "kubernetes_namespace" "prometheus_stack" {
  count = var.prometheus_stack_enabled && var.prometheus_stack_create_namespace ? 1 : 0

  metadata {
    name = var.prometheus_stack_namespace
  }
}

locals {
  prometheus_stack_namespace = var.prometheus_stack_enabled && var.prometheus_stack_create_namespace ? kubernetes_namespace.prometheus_stack[0].metadata[0].name : var.prometheus_stack_namespace
}

module "grafana_loki_datasource" {
  count = var.prometheus_stack_enabled && var.loki_enabled ? 1 : 0

  source            = "./modules/monitoring-grafana-loki-datasource"
  loki_namespace    = var.loki_namespace
  grafana_namespace = local.prometheus_stack_namespace

  depends_on = [module.loki]
}

module "loki_dashboards" {
  count     = var.prometheus_stack_enabled && var.loki_enabled ? 1 : 0
  source    = "./modules/monitoring-loki-grafana-dashboards"
  namespace = local.prometheus_stack_namespace

  depends_on = [module.loki]
}

module "grafana_tempo_datasource" {
  count = var.prometheus_stack_enabled && var.tempo_enabled ? 1 : 0

  source            = "./modules/monitoring-grafana-tempo-datasource"
  tempo_namespace   = var.tempo_namespace
  grafana_namespace = local.prometheus_stack_namespace

  depends_on = [module.tempo]
}

resource "kubernetes_secret_v1" "grafana_admin_secret" {
  count = var.prometheus_stack_enabled ? 1 : 0

  metadata {
    name      = "grafana-admin-secret"
    namespace = local.prometheus_stack_namespace
  }

  data = {
    admin-user     = var.prometheus_stack_grafana_admin_login
    admin-password = var.prometheus_stack_grafana_admin_password
  }
}

module "prometheus_stack" {
  count  = var.prometheus_stack_enabled ? 1 : 0
  source = "./modules/monitoring-prometheus-stack"

  chart_name       = var.prometheus_stack_chart_name
  chart_repository = var.prometheus_stack_chart_repository
  chart_version    = var.prometheus_stack_chart_version
  create_namespace = var.prometheus_stack_create_namespace
  namespace        = local.prometheus_stack_namespace
  release_name     = var.prometheus_stack_release_name
  settings         = var.prometheus_stack_settings
  timeout          = var.prometheus_stack_timeout
  values           = coalescelist(var.prometheus_stack_values, [
    file("${path.module}/default-configs/prometheus-stack/values.yaml")
  ])

  depends_on = [module.loki]
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
  values           = coalescelist(var.pulsar_kaap_values, [
    file("${path.module}/default-configs/pulsar-kaap/values.yaml")
  ])
}

module "kaap_pod_monitor" {
  count     = var.prometheus_stack_enabled && var.pulsar_kaap_enabled ? 1 : 0
  source    = "./modules/monitoring-kaap-pod-monitor"
  namespace = var.pulsar_kaap_namespace

  depends_on = [module.prometheus_stack, module.pulsar_kaap]
}

module "kaap_dashboards" {
  count     = var.prometheus_stack_enabled && var.pulsar_kaap_enabled ? 1 : 0
  source    = "./modules/monitoring-kaap-grafana-dashboards"
  namespace = local.prometheus_stack_namespace

  depends_on = [module.pulsar_kaap]
}

locals {
  streamx_operator_namespace                           = var.streamx_operator_create_namespace ? kubernetes_namespace.streamx_operator[0].metadata[0].name : var.streamx_operator_namespace
  streamx_operator_image_pull_secret_name              = var.streamx_operator_image_pull_secret_enabled ? module.streamx_operator_image_pull_secret[0].secret_name : var.streamx_operator_image_pull_secret_name
  streamx_operator_messaging_pulsar_client_service_url = var.streamx_operator_messaging_pulsar_client_service_url == null && var.pulsar_kaap_enabled ? module.pulsar_kaap[0].client_service_url : var.streamx_operator_messaging_pulsar_client_service_url
  streamx_operator_messaging_pulsar_admin_service_url  = var.streamx_operator_messaging_pulsar_admin_service_url == null && var.pulsar_kaap_enabled ? module.pulsar_kaap[0].admin_service_url : var.streamx_operator_messaging_pulsar_admin_service_url
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

locals {
  default_streamx_operator_monitoring_traces_mode = var.opentelemetry_collector_deamonset_enabled ? "K8S_HOST_IP" : "DISABLED"
  streamx_operator_monitoring_traces_mode         = var.streamx_operator_monitoring_traces_mode == null ? local.default_streamx_operator_monitoring_traces_mode : var.streamx_operator_monitoring_traces_mode
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
      image = {
        tag = "0.0.12-jvm"
      }
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
          mode     = local.streamx_operator_monitoring_traces_mode
          endpoint = var.streamx_operator_monitoring_traces_endpoint
        }
      }
    })
  ])
}

module "streamx_pod_monitor" {
  count     = var.prometheus_stack_enabled && var.streamx_operator_enabled ? 1 : 0
  source    = "./modules/monitoring-streamx-pod-monitor"
  namespace = local.streamx_operator_namespace

  depends_on = [module.prometheus_stack, module.streamx_operator]
}

module "streamx_dashboards" {
  count     = var.prometheus_stack_enabled && var.streamx_operator_enabled ? 1 : 0
  source    = "./modules/monitoring-streamx-grafana-dashboards"
  namespace = local.prometheus_stack_namespace

  depends_on = [module.streamx_operator]
}
