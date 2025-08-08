<!-- Copyright 2025 Dynamic Solutions Sp. z o.o. sp.k.

  ~ Licensed under the Apache License, Version 2.0 (the "License");
  ~ you may not use this file except in compliance with the License.
  ~ You may obtain a copy of the License at
  ~ 
  ~     http://www.apache.org/licenses/LICENSE-2.0
  ~ 
  ~ Unless required by applicable law or agreed to in writing, software
  ~ distributed under the License is distributed on an "AS IS" BASIS,
  ~ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  ~ See the License for the specific language governing permissions and
  ~ limitations under the License.
-->

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.17.0, < 3.0.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >= 1.14.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.35.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.35.1 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cert_manager"></a> [cert\_manager](#module\_cert\_manager) | ./modules/cert-manager | n/a |
| <a name="module_cert_manager_lets_encrypt_issuer"></a> [cert\_manager\_lets\_encrypt\_issuer](#module\_cert\_manager\_lets\_encrypt\_issuer) | ./modules/cert-manager-issuer-lets-encrypt | n/a |
| <a name="module_grafana_loki_datasource"></a> [grafana\_loki\_datasource](#module\_grafana\_loki\_datasource) | ./modules/monitoring-grafana-loki-datasource | n/a |
| <a name="module_grafana_tempo_datasource"></a> [grafana\_tempo\_datasource](#module\_grafana\_tempo\_datasource) | ./modules/monitoring-grafana-tempo-datasource | n/a |
| <a name="module_ingress_controller_apisix"></a> [ingress\_controller\_apisix](#module\_ingress\_controller\_apisix) | ./modules/ingress-controller-apisix | n/a |
| <a name="module_ingress_controller_nginx"></a> [ingress\_controller\_nginx](#module\_ingress\_controller\_nginx) | ./modules/ingress-controller-nginx | n/a |
| <a name="module_kaap_dashboards"></a> [kaap\_dashboards](#module\_kaap\_dashboards) | ./modules/monitoring-kaap-grafana-dashboards | n/a |
| <a name="module_kaap_pod_monitor"></a> [kaap\_pod\_monitor](#module\_kaap\_pod\_monitor) | ./modules/monitoring-kaap-pod-monitor | n/a |
| <a name="module_loki"></a> [loki](#module\_loki) | ./modules/monitoring-loki | n/a |
| <a name="module_loki_dashboards"></a> [loki\_dashboards](#module\_loki\_dashboards) | ./modules/monitoring-loki-grafana-dashboards | n/a |
| <a name="module_minio"></a> [minio](#module\_minio) | ./modules/minio | n/a |
| <a name="module_opentelemetry_collector_deamonset"></a> [opentelemetry\_collector\_deamonset](#module\_opentelemetry\_collector\_deamonset) | ./modules/monitoring-opentelemetry-collector | n/a |
| <a name="module_opentelemetry_operator"></a> [opentelemetry\_operator](#module\_opentelemetry\_operator) | ./modules/monitoring-opentelemetry-operator | n/a |
| <a name="module_prometheus_stack"></a> [prometheus\_stack](#module\_prometheus\_stack) | ./modules/monitoring-prometheus-stack | n/a |
| <a name="module_pulsar_kaap"></a> [pulsar\_kaap](#module\_pulsar\_kaap) | ./modules/pulsar-kaap | n/a |
| <a name="module_streamx_dashboards"></a> [streamx\_dashboards](#module\_streamx\_dashboards) | ./modules/monitoring-streamx-grafana-dashboards | n/a |
| <a name="module_streamx_operator"></a> [streamx\_operator](#module\_streamx\_operator) | ./modules/streamx-operator | n/a |
| <a name="module_streamx_operator_image_pull_secret"></a> [streamx\_operator\_image\_pull\_secret](#module\_streamx\_operator\_image\_pull\_secret) | ./modules/docker-config-secret | n/a |
| <a name="module_streamx_pod_monitor"></a> [streamx\_pod\_monitor](#module\_streamx\_pod\_monitor) | ./modules/monitoring-streamx-pod-monitor | n/a |
| <a name="module_tempo"></a> [tempo](#module\_tempo) | ./modules/monitoring-tempo | n/a |

## Resources

| Name | Type |
|------|------|
| [kubernetes_namespace.loki](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.minio](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.prometheus_stack](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.streamx_operator](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.tempo](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_secret_v1.grafana_admin_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret_v1) | resource |
| [kubernetes_secret_v1.loki_s3_access_keys](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret_v1) | resource |
| [kubernetes_secret_v1.minio_s3_access_keys](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret_v1) | resource |
| [kubernetes_secret_v1.tempo_s3_access_keys](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret_v1) | resource |
| [random_password.minio_secret_access_key](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cert_manager_chart_name"></a> [cert\_manager\_chart\_name](#input\_cert\_manager\_chart\_name) | The name of the Helm chart to install | `string` | `null` | no |
| <a name="input_cert_manager_chart_repository"></a> [cert\_manager\_chart\_repository](#input\_cert\_manager\_chart\_repository) | The repository containing the Helm chart to install. | `string` | `null` | no |
| <a name="input_cert_manager_chart_version"></a> [cert\_manager\_chart\_version](#input\_cert\_manager\_chart\_version) | The version of the Helm chart to install. | `string` | `null` | no |
| <a name="input_cert_manager_create_namespace"></a> [cert\_manager\_create\_namespace](#input\_cert\_manager\_create\_namespace) | Create a namespace for the deployment. | `bool` | `null` | no |
| <a name="input_cert_manager_enabled"></a> [cert\_manager\_enabled](#input\_cert\_manager\_enabled) | Enables Cert Manager. | `bool` | `true` | no |
| <a name="input_cert_manager_lets_encrypt_issuer_acme_email"></a> [cert\_manager\_lets\_encrypt\_issuer\_acme\_email](#input\_cert\_manager\_lets\_encrypt\_issuer\_acme\_email) | Email passed to acme server. | `string` | n/a | yes |
| <a name="input_cert_manager_lets_encrypt_issuer_enabled"></a> [cert\_manager\_lets\_encrypt\_issuer\_enabled](#input\_cert\_manager\_lets\_encrypt\_issuer\_enabled) | Enables Cert Manager Let's Encrypt Issuer. | `bool` | `true` | no |
| <a name="input_cert_manager_lets_encrypt_issuer_ingress_class"></a> [cert\_manager\_lets\_encrypt\_issuer\_ingress\_class](#input\_cert\_manager\_lets\_encrypt\_issuer\_ingress\_class) | Cluster Issuer Ingress class name | `string` | `null` | no |
| <a name="input_cert_manager_lets_encrypt_issuer_name"></a> [cert\_manager\_lets\_encrypt\_issuer\_name](#input\_cert\_manager\_lets\_encrypt\_issuer\_name) | Cluster Issuer name | `string` | `null` | no |
| <a name="input_cert_manager_lets_encrypt_issuer_namespace"></a> [cert\_manager\_lets\_encrypt\_issuer\_namespace](#input\_cert\_manager\_lets\_encrypt\_issuer\_namespace) | The namespace used for the deployment | `string` | `null` | no |
| <a name="input_cert_manager_lets_encrypt_issuer_prod_letsencrypt_server"></a> [cert\_manager\_lets\_encrypt\_issuer\_prod\_letsencrypt\_server](#input\_cert\_manager\_lets\_encrypt\_issuer\_prod\_letsencrypt\_server) | Determines if created Cluster Issuer should use prod or staging acme server. | `bool` | `null` | no |
| <a name="input_cert_manager_namespace"></a> [cert\_manager\_namespace](#input\_cert\_manager\_namespace) | The namespace used for the deployment | `string` | `null` | no |
| <a name="input_cert_manager_release_name"></a> [cert\_manager\_release\_name](#input\_cert\_manager\_release\_name) | The name of the helm release. | `string` | `null` | no |
| <a name="input_cert_manager_settings"></a> [cert\_manager\_settings](#input\_cert\_manager\_settings) | Additional key value settings which will be passed to the Helm chart values, e.g. { "namespace" = "kube-system" }. | `map(any)` | `null` | no |
| <a name="input_cert_manager_timeout"></a> [cert\_manager\_timeout](#input\_cert\_manager\_timeout) | Time in seconds to wait for any individual kubernetes operation | `number` | `null` | no |
| <a name="input_cert_manager_values"></a> [cert\_manager\_values](#input\_cert\_manager\_values) | A list of values in raw YAML to be applied to the helm release. Overrides default values from [default-configs](./default-configs). Merges with the settings input, can also be used with the `file()` function, i.e. `file("my/values.yaml")`. | `list(string)` | `null` | no |
| <a name="input_ingress_controller_apisix_chart_name"></a> [ingress\_controller\_apisix\_chart\_name](#input\_ingress\_controller\_apisix\_chart\_name) | The name of the Helm chart to install | `string` | `null` | no |
| <a name="input_ingress_controller_apisix_chart_repository"></a> [ingress\_controller\_apisix\_chart\_repository](#input\_ingress\_controller\_apisix\_chart\_repository) | The repository containing the Helm chart to install. | `string` | `null` | no |
| <a name="input_ingress_controller_apisix_chart_version"></a> [ingress\_controller\_apisix\_chart\_version](#input\_ingress\_controller\_apisix\_chart\_version) | The version of the Helm chart to install. | `string` | `null` | no |
| <a name="input_ingress_controller_apisix_create_namespace"></a> [ingress\_controller\_apisix\_create\_namespace](#input\_ingress\_controller\_apisix\_create\_namespace) | Create a namespace for the deployment. | `bool` | `null` | no |
| <a name="input_ingress_controller_apisix_enabled"></a> [ingress\_controller\_apisix\_enabled](#input\_ingress\_controller\_apisix\_enabled) | Enables APISIX Ingress Controller. | `bool` | `true` | no |
| <a name="input_ingress_controller_apisix_namespace"></a> [ingress\_controller\_apisix\_namespace](#input\_ingress\_controller\_apisix\_namespace) | The namespace used for the deployment | `string` | `null` | no |
| <a name="input_ingress_controller_apisix_release_name"></a> [ingress\_controller\_apisix\_release\_name](#input\_ingress\_controller\_apisix\_release\_name) | The name of the helm release. | `string` | `null` | no |
| <a name="input_ingress_controller_apisix_settings"></a> [ingress\_controller\_apisix\_settings](#input\_ingress\_controller\_apisix\_settings) | Additional key value settings which will be passed to the Helm chart values, e.g. { "namespace" = "kube-system" }. | `map(any)` | `null` | no |
| <a name="input_ingress_controller_apisix_timeout"></a> [ingress\_controller\_apisix\_timeout](#input\_ingress\_controller\_apisix\_timeout) | Time in seconds to wait for any individual kubernetes operation | `number` | `null` | no |
| <a name="input_ingress_controller_apisix_values"></a> [ingress\_controller\_apisix\_values](#input\_ingress\_controller\_apisix\_values) | A list of values in raw YAML to be applied to the helm release. Overrides default values from [default-configs](./default-configs). Merges with the settings input, can also be used with the `file()` function, i.e. `file("my/values.yaml")`. | `list(string)` | `null` | no |
| <a name="input_ingress_controller_nginx_chart_name"></a> [ingress\_controller\_nginx\_chart\_name](#input\_ingress\_controller\_nginx\_chart\_name) | The name of the Helm chart to install | `string` | `null` | no |
| <a name="input_ingress_controller_nginx_chart_repository"></a> [ingress\_controller\_nginx\_chart\_repository](#input\_ingress\_controller\_nginx\_chart\_repository) | The repository containing the Helm chart to install. | `string` | `null` | no |
| <a name="input_ingress_controller_nginx_chart_version"></a> [ingress\_controller\_nginx\_chart\_version](#input\_ingress\_controller\_nginx\_chart\_version) | The version of the Helm chart to install. | `string` | `null` | no |
| <a name="input_ingress_controller_nginx_create_namespace"></a> [ingress\_controller\_nginx\_create\_namespace](#input\_ingress\_controller\_nginx\_create\_namespace) | Create a namespace for the deployment. | `bool` | `null` | no |
| <a name="input_ingress_controller_nginx_enabled"></a> [ingress\_controller\_nginx\_enabled](#input\_ingress\_controller\_nginx\_enabled) | Enables NGINX Ingress Controller. | `bool` | `false` | no |
| <a name="input_ingress_controller_nginx_namespace"></a> [ingress\_controller\_nginx\_namespace](#input\_ingress\_controller\_nginx\_namespace) | The namespace used for the deployment | `string` | `null` | no |
| <a name="input_ingress_controller_nginx_release_name"></a> [ingress\_controller\_nginx\_release\_name](#input\_ingress\_controller\_nginx\_release\_name) | The name of the helm release. | `string` | `null` | no |
| <a name="input_ingress_controller_nginx_settings"></a> [ingress\_controller\_nginx\_settings](#input\_ingress\_controller\_nginx\_settings) | Additional key value settings which will be passed to the Helm chart values, e.g. { "namespace" = "kube-system" }. | `map(any)` | `null` | no |
| <a name="input_ingress_controller_nginx_timeout"></a> [ingress\_controller\_nginx\_timeout](#input\_ingress\_controller\_nginx\_timeout) | Time in seconds to wait for any individual kubernetes operation | `number` | `null` | no |
| <a name="input_ingress_controller_nginx_values"></a> [ingress\_controller\_nginx\_values](#input\_ingress\_controller\_nginx\_values) | A list of values in raw YAML to be applied to the helm release. Overrides default values from [default-configs](./default-configs). Merges with the settings input, can also be used with the `file()` function, i.e. `file("my/values.yaml")`. | `list(string)` | `null` | no |
| <a name="input_loki_chart_name"></a> [loki\_chart\_name](#input\_loki\_chart\_name) | The name of the Helm chart to install | `string` | `null` | no |
| <a name="input_loki_chart_repository"></a> [loki\_chart\_repository](#input\_loki\_chart\_repository) | The repository containing the Helm chart to install. | `string` | `null` | no |
| <a name="input_loki_chart_version"></a> [loki\_chart\_version](#input\_loki\_chart\_version) | The version of the Helm chart to install. | `string` | `null` | no |
| <a name="input_loki_create_namespace"></a> [loki\_create\_namespace](#input\_loki\_create\_namespace) | Create a namespace for the deployment. | `bool` | `true` | no |
| <a name="input_loki_enabled"></a> [loki\_enabled](#input\_loki\_enabled) | Enables Loki. | `bool` | `true` | no |
| <a name="input_loki_namespace"></a> [loki\_namespace](#input\_loki\_namespace) | The namespace used for the deployment | `string` | `"loki"` | no |
| <a name="input_loki_release_name"></a> [loki\_release\_name](#input\_loki\_release\_name) | The name of the helm release. | `string` | `null` | no |
| <a name="input_loki_settings"></a> [loki\_settings](#input\_loki\_settings) | Additional key value settings which will be passed to the Helm chart values, e.g. { "namespace" = "kube-system" }. | `map(any)` | `null` | no |
| <a name="input_loki_timeout"></a> [loki\_timeout](#input\_loki\_timeout) | Time in seconds to wait for any individual kubernetes operation | `number` | `null` | no |
| <a name="input_loki_values"></a> [loki\_values](#input\_loki\_values) | A list of values in raw YAML to be applied to the helm release. Overrides default values from [default-configs](./default-configs). Merges with the settings input, can also be used with the `file()` function, i.e. `file("my/values.yaml")`. | `list(string)` | `null` | no |
| <a name="input_minio_chart_name"></a> [minio\_chart\_name](#input\_minio\_chart\_name) | The name of the Helm chart to install | `string` | `null` | no |
| <a name="input_minio_chart_repository"></a> [minio\_chart\_repository](#input\_minio\_chart\_repository) | The repository containing the Helm chart to install. | `string` | `null` | no |
| <a name="input_minio_chart_version"></a> [minio\_chart\_version](#input\_minio\_chart\_version) | The version of the Helm chart to install. | `string` | `null` | no |
| <a name="input_minio_create_namespace"></a> [minio\_create\_namespace](#input\_minio\_create\_namespace) | Create a namespace for the deployment. | `bool` | `true` | no |
| <a name="input_minio_enabled"></a> [minio\_enabled](#input\_minio\_enabled) | Enables MinIO. | `bool` | `true` | no |
| <a name="input_minio_namespace"></a> [minio\_namespace](#input\_minio\_namespace) | The namespace used for the deployment | `string` | `"minio"` | no |
| <a name="input_minio_release_name"></a> [minio\_release\_name](#input\_minio\_release\_name) | The name of the helm release. | `string` | `null` | no |
| <a name="input_minio_settings"></a> [minio\_settings](#input\_minio\_settings) | Additional key value settings which will be passed to the Helm chart values, e.g. { "namespace" = "kube-system" }. | `map(any)` | `null` | no |
| <a name="input_minio_timeout"></a> [minio\_timeout](#input\_minio\_timeout) | Time in seconds to wait for any individual kubernetes operation | `number` | `null` | no |
| <a name="input_minio_values"></a> [minio\_values](#input\_minio\_values) | A list of values in raw YAML to be applied to the helm release. Overrides default values from [default-configs](./default-configs). Merges with the settings input, can also be used with the `file()` function, i.e. `file("my/values.yaml")`. | `list(string)` | `null` | no |
| <a name="input_opentelemetry_collector_deamonset_chart_name"></a> [opentelemetry\_collector\_deamonset\_chart\_name](#input\_opentelemetry\_collector\_deamonset\_chart\_name) | The name of the Helm chart to install | `string` | `null` | no |
| <a name="input_opentelemetry_collector_deamonset_chart_repository"></a> [opentelemetry\_collector\_deamonset\_chart\_repository](#input\_opentelemetry\_collector\_deamonset\_chart\_repository) | The repository containing the Helm chart to install. | `string` | `null` | no |
| <a name="input_opentelemetry_collector_deamonset_chart_version"></a> [opentelemetry\_collector\_deamonset\_chart\_version](#input\_opentelemetry\_collector\_deamonset\_chart\_version) | The version of the Helm chart to install. | `string` | `null` | no |
| <a name="input_opentelemetry_collector_deamonset_create_namespace"></a> [opentelemetry\_collector\_deamonset\_create\_namespace](#input\_opentelemetry\_collector\_deamonset\_create\_namespace) | Create a namespace for the deployment. | `bool` | `true` | no |
| <a name="input_opentelemetry_collector_deamonset_enabled"></a> [opentelemetry\_collector\_deamonset\_enabled](#input\_opentelemetry\_collector\_deamonset\_enabled) | Enables OpenTelemetry Collector Deamonset. | `bool` | `true` | no |
| <a name="input_opentelemetry_collector_deamonset_logs_otlphttp_endpoint"></a> [opentelemetry\_collector\_deamonset\_logs\_otlphttp\_endpoint](#input\_opentelemetry\_collector\_deamonset\_logs\_otlphttp\_endpoint) | Logs OTLP HTTP endpoint. | `string` | `null` | no |
| <a name="input_opentelemetry_collector_deamonset_metrics_otlphttp_endpoint"></a> [opentelemetry\_collector\_deamonset\_metrics\_otlphttp\_endpoint](#input\_opentelemetry\_collector\_deamonset\_metrics\_otlphttp\_endpoint) | Metrics OTLP HTTP endpoint. | `string` | `null` | no |
| <a name="input_opentelemetry_collector_deamonset_namespace"></a> [opentelemetry\_collector\_deamonset\_namespace](#input\_opentelemetry\_collector\_deamonset\_namespace) | The namespace used for the deployment | `string` | `null` | no |
| <a name="input_opentelemetry_collector_deamonset_release_name"></a> [opentelemetry\_collector\_deamonset\_release\_name](#input\_opentelemetry\_collector\_deamonset\_release\_name) | The name of the helm release. | `string` | `"collector-deamonset"` | no |
| <a name="input_opentelemetry_collector_deamonset_settings"></a> [opentelemetry\_collector\_deamonset\_settings](#input\_opentelemetry\_collector\_deamonset\_settings) | Additional key value settings which will be passed to the Helm chart values, e.g. { "namespace" = "kube-system" }. | `map(any)` | `null` | no |
| <a name="input_opentelemetry_collector_deamonset_timeout"></a> [opentelemetry\_collector\_deamonset\_timeout](#input\_opentelemetry\_collector\_deamonset\_timeout) | Time in seconds to wait for any individual kubernetes operation | `number` | `null` | no |
| <a name="input_opentelemetry_collector_deamonset_traces_otlp_endpoint"></a> [opentelemetry\_collector\_deamonset\_traces\_otlp\_endpoint](#input\_opentelemetry\_collector\_deamonset\_traces\_otlp\_endpoint) | Traces OTLP endpoint. | `string` | `null` | no |
| <a name="input_opentelemetry_collector_deamonset_values"></a> [opentelemetry\_collector\_deamonset\_values](#input\_opentelemetry\_collector\_deamonset\_values) | A list of values in raw YAML to be applied to the helm release. Overrides default values from [default-configs](./default-configs). Merges with the settings input, can also be used with the `file()` function, i.e. `file("my/values.yaml")`. | `list(string)` | `null` | no |
| <a name="input_opentelemetry_collector_statefulset_chart_name"></a> [opentelemetry\_collector\_statefulset\_chart\_name](#input\_opentelemetry\_collector\_statefulset\_chart\_name) | The name of the Helm chart to install | `string` | `null` | no |
| <a name="input_opentelemetry_collector_statefulset_chart_repository"></a> [opentelemetry\_collector\_statefulset\_chart\_repository](#input\_opentelemetry\_collector\_statefulset\_chart\_repository) | The repository containing the Helm chart to install. | `string` | `null` | no |
| <a name="input_opentelemetry_collector_statefulset_chart_version"></a> [opentelemetry\_collector\_statefulset\_chart\_version](#input\_opentelemetry\_collector\_statefulset\_chart\_version) | The version of the Helm chart to install. | `string` | `null` | no |
| <a name="input_opentelemetry_collector_statefulset_create_namespace"></a> [opentelemetry\_collector\_statefulset\_create\_namespace](#input\_opentelemetry\_collector\_statefulset\_create\_namespace) | Create a namespace for the deployment. | `bool` | `true` | no |
| <a name="input_opentelemetry_collector_statefulset_namespace"></a> [opentelemetry\_collector\_statefulset\_namespace](#input\_opentelemetry\_collector\_statefulset\_namespace) | The namespace used for the deployment | `string` | `null` | no |
| <a name="input_opentelemetry_collector_statefulset_release_name"></a> [opentelemetry\_collector\_statefulset\_release\_name](#input\_opentelemetry\_collector\_statefulset\_release\_name) | The name of the helm release. | `string` | `"collector-statefulset"` | no |
| <a name="input_opentelemetry_collector_statefulset_settings"></a> [opentelemetry\_collector\_statefulset\_settings](#input\_opentelemetry\_collector\_statefulset\_settings) | Additional key value settings which will be passed to the Helm chart values, e.g. { "namespace" = "kube-system" }. | `map(any)` | `null` | no |
| <a name="input_opentelemetry_collector_statefulset_timeout"></a> [opentelemetry\_collector\_statefulset\_timeout](#input\_opentelemetry\_collector\_statefulset\_timeout) | Time in seconds to wait for any individual kubernetes operation | `number` | `null` | no |
| <a name="input_opentelemetry_collector_statefulset_values"></a> [opentelemetry\_collector\_statefulset\_values](#input\_opentelemetry\_collector\_statefulset\_values) | A list of values in raw YAML to be applied to the helm release. Overrides default values from [default-configs](./default-configs). Merges with the settings input, can also be used with the `file()` function, i.e. `file("my/values.yaml")`. | `list(string)` | `null` | no |
| <a name="input_opentelemetry_operator_chart_name"></a> [opentelemetry\_operator\_chart\_name](#input\_opentelemetry\_operator\_chart\_name) | The name of the Helm chart to install | `string` | `null` | no |
| <a name="input_opentelemetry_operator_chart_repository"></a> [opentelemetry\_operator\_chart\_repository](#input\_opentelemetry\_operator\_chart\_repository) | The repository containing the Helm chart to install. | `string` | `null` | no |
| <a name="input_opentelemetry_operator_chart_version"></a> [opentelemetry\_operator\_chart\_version](#input\_opentelemetry\_operator\_chart\_version) | The version of the Helm chart to install. | `string` | `null` | no |
| <a name="input_opentelemetry_operator_create_namespace"></a> [opentelemetry\_operator\_create\_namespace](#input\_opentelemetry\_operator\_create\_namespace) | Create a namespace for the deployment. | `bool` | `true` | no |
| <a name="input_opentelemetry_operator_enabled"></a> [opentelemetry\_operator\_enabled](#input\_opentelemetry\_operator\_enabled) | Enables OpenTelemetry Operator. | `bool` | `true` | no |
| <a name="input_opentelemetry_operator_namespace"></a> [opentelemetry\_operator\_namespace](#input\_opentelemetry\_operator\_namespace) | The namespace used for the deployment | `string` | `null` | no |
| <a name="input_opentelemetry_operator_release_name"></a> [opentelemetry\_operator\_release\_name](#input\_opentelemetry\_operator\_release\_name) | The name of the helm release. | `string` | `null` | no |
| <a name="input_opentelemetry_operator_settings"></a> [opentelemetry\_operator\_settings](#input\_opentelemetry\_operator\_settings) | Additional key value settings which will be passed to the Helm chart values, e.g. { "namespace" = "kube-system" }. | `map(any)` | `null` | no |
| <a name="input_opentelemetry_operator_timeout"></a> [opentelemetry\_operator\_timeout](#input\_opentelemetry\_operator\_timeout) | Time in seconds to wait for any individual kubernetes operation | `number` | `null` | no |
| <a name="input_opentelemetry_operator_values"></a> [opentelemetry\_operator\_values](#input\_opentelemetry\_operator\_values) | A list of values in raw YAML to be applied to the helm release. Overrides default values from [default-configs](./default-configs). Merges with the settings input, can also be used with the `file()` function, i.e. `file("my/values.yaml")`. | `list(string)` | `null` | no |
| <a name="input_prometheus_stack_chart_name"></a> [prometheus\_stack\_chart\_name](#input\_prometheus\_stack\_chart\_name) | The name of the Helm chart to install | `string` | `null` | no |
| <a name="input_prometheus_stack_chart_repository"></a> [prometheus\_stack\_chart\_repository](#input\_prometheus\_stack\_chart\_repository) | The repository containing the Helm chart to install. | `string` | `null` | no |
| <a name="input_prometheus_stack_chart_version"></a> [prometheus\_stack\_chart\_version](#input\_prometheus\_stack\_chart\_version) | The version of the Helm chart to install. | `string` | `null` | no |
| <a name="input_prometheus_stack_create_namespace"></a> [prometheus\_stack\_create\_namespace](#input\_prometheus\_stack\_create\_namespace) | Create a namespace for the deployment. | `bool` | `true` | no |
| <a name="input_prometheus_stack_enabled"></a> [prometheus\_stack\_enabled](#input\_prometheus\_stack\_enabled) | Enables Kubernetes Prometheus Stack. | `bool` | `true` | no |
| <a name="input_prometheus_stack_grafana_admin_login"></a> [prometheus\_stack\_grafana\_admin\_login](#input\_prometheus\_stack\_grafana\_admin\_login) | Grafana admin user login | `string` | `"sxadmin"` | no |
| <a name="input_prometheus_stack_grafana_admin_password"></a> [prometheus\_stack\_grafana\_admin\_password](#input\_prometheus\_stack\_grafana\_admin\_password) | Grafana admin user password | `string` | `"sxadmin"` | no |
| <a name="input_prometheus_stack_namespace"></a> [prometheus\_stack\_namespace](#input\_prometheus\_stack\_namespace) | The namespace used for the deployment | `string` | `"prometheus-stack"` | no |
| <a name="input_prometheus_stack_release_name"></a> [prometheus\_stack\_release\_name](#input\_prometheus\_stack\_release\_name) | The name of the helm release. | `string` | `null` | no |
| <a name="input_prometheus_stack_settings"></a> [prometheus\_stack\_settings](#input\_prometheus\_stack\_settings) | Additional key value settings which will be passed to the Helm chart values, e.g. { "namespace" = "kube-system" }. | `map(any)` | `null` | no |
| <a name="input_prometheus_stack_timeout"></a> [prometheus\_stack\_timeout](#input\_prometheus\_stack\_timeout) | Time in seconds to wait for any individual kubernetes operation | `number` | `null` | no |
| <a name="input_prometheus_stack_values"></a> [prometheus\_stack\_values](#input\_prometheus\_stack\_values) | A list of values in raw YAML to be applied to the helm release. Overrides default values from [default-configs](./default-configs). Merges with the settings input, can also be used with the `file()` function, i.e. `file("my/values.yaml")`. | `list(string)` | `null` | no |
| <a name="input_pulsar_kaap_chart_name"></a> [pulsar\_kaap\_chart\_name](#input\_pulsar\_kaap\_chart\_name) | The name of the Helm chart to install | `string` | `null` | no |
| <a name="input_pulsar_kaap_chart_repository"></a> [pulsar\_kaap\_chart\_repository](#input\_pulsar\_kaap\_chart\_repository) | The repository containing the Helm chart to install. | `string` | `null` | no |
| <a name="input_pulsar_kaap_chart_version"></a> [pulsar\_kaap\_chart\_version](#input\_pulsar\_kaap\_chart\_version) | The version of the Helm chart to install. | `string` | `null` | no |
| <a name="input_pulsar_kaap_create_namespace"></a> [pulsar\_kaap\_create\_namespace](#input\_pulsar\_kaap\_create\_namespace) | Create a namespace for the deployment. | `bool` | `null` | no |
| <a name="input_pulsar_kaap_enabled"></a> [pulsar\_kaap\_enabled](#input\_pulsar\_kaap\_enabled) | Enables Kubernetes Autoscaling for Apache Pulsar (KAAP). | `bool` | `true` | no |
| <a name="input_pulsar_kaap_namespace"></a> [pulsar\_kaap\_namespace](#input\_pulsar\_kaap\_namespace) | The namespace used for the deployment | `string` | `null` | no |
| <a name="input_pulsar_kaap_release_name"></a> [pulsar\_kaap\_release\_name](#input\_pulsar\_kaap\_release\_name) | The name of the helm release. | `string` | `null` | no |
| <a name="input_pulsar_kaap_settings"></a> [pulsar\_kaap\_settings](#input\_pulsar\_kaap\_settings) | Additional key value settings which will be passed to the Helm chart values, e.g. { "namespace" = "kube-system" }. | `map(any)` | `null` | no |
| <a name="input_pulsar_kaap_timeout"></a> [pulsar\_kaap\_timeout](#input\_pulsar\_kaap\_timeout) | Time in seconds to wait for any individual kubernetes operation | `number` | `null` | no |
| <a name="input_pulsar_kaap_values"></a> [pulsar\_kaap\_values](#input\_pulsar\_kaap\_values) | A list of values in raw YAML to be applied to the helm release. Overrides default values from [default-configs](./default-configs). Merges with the settings input, can also be used with the `file()` function, i.e. `file("my/values.yaml")`. | `list(string)` | `null` | no |
| <a name="input_streamx_operator_chart_name"></a> [streamx\_operator\_chart\_name](#input\_streamx\_operator\_chart\_name) | The name of the Helm chart to install | `string` | `null` | no |
| <a name="input_streamx_operator_chart_repository"></a> [streamx\_operator\_chart\_repository](#input\_streamx\_operator\_chart\_repository) | The repository containing the Helm chart to install. | `string` | `null` | no |
| <a name="input_streamx_operator_chart_repository_password"></a> [streamx\_operator\_chart\_repository\_password](#input\_streamx\_operator\_chart\_repository\_password) | The password used for the repository authentication. | `string` | `null` | no |
| <a name="input_streamx_operator_chart_repository_username"></a> [streamx\_operator\_chart\_repository\_username](#input\_streamx\_operator\_chart\_repository\_username) | The username used for the repository authentication. | `string` | `null` | no |
| <a name="input_streamx_operator_chart_version"></a> [streamx\_operator\_chart\_version](#input\_streamx\_operator\_chart\_version) | The version of the Helm chart to install. | `string` | `null` | no |
| <a name="input_streamx_operator_create_namespace"></a> [streamx\_operator\_create\_namespace](#input\_streamx\_operator\_create\_namespace) | Create a namespace for the deployment. | `bool` | `true` | no |
| <a name="input_streamx_operator_enabled"></a> [streamx\_operator\_enabled](#input\_streamx\_operator\_enabled) | Enables StreamX Operator. | `bool` | `true` | no |
| <a name="input_streamx_operator_image_pull_secret_enabled"></a> [streamx\_operator\_image\_pull\_secret\_enabled](#input\_streamx\_operator\_image\_pull\_secret\_enabled) | Enables StreamX Operator Image Pull Secret. | `bool` | `true` | no |
| <a name="input_streamx_operator_image_pull_secret_name"></a> [streamx\_operator\_image\_pull\_secret\_name](#input\_streamx\_operator\_image\_pull\_secret\_name) | StreamX Operator image pull secret name. | `string` | `"sx-operator-image-pull-secret"` | no |
| <a name="input_streamx_operator_image_pull_secret_registry_email"></a> [streamx\_operator\_image\_pull\_secret\_registry\_email](#input\_streamx\_operator\_image\_pull\_secret\_registry\_email) | StreamX Operator container image registry user email. | `string` | n/a | yes |
| <a name="input_streamx_operator_image_pull_secret_registry_password"></a> [streamx\_operator\_image\_pull\_secret\_registry\_password](#input\_streamx\_operator\_image\_pull\_secret\_registry\_password) | StreamX Operator container image registry user password. | `string` | n/a | yes |
| <a name="input_streamx_operator_image_pull_secret_registry_server"></a> [streamx\_operator\_image\_pull\_secret\_registry\_server](#input\_streamx\_operator\_image\_pull\_secret\_registry\_server) | StreamX Operator container image registry server. | `string` | `"europe-west1-docker.pkg.dev"` | no |
| <a name="input_streamx_operator_image_pull_secret_registry_username"></a> [streamx\_operator\_image\_pull\_secret\_registry\_username](#input\_streamx\_operator\_image\_pull\_secret\_registry\_username) | StreamX Operator container image registry username. | `string` | `"_json_key_base64"` | no |
| <a name="input_streamx_operator_messaging_pulsar_admin_service_url"></a> [streamx\_operator\_messaging\_pulsar\_admin\_service\_url](#input\_streamx\_operator\_messaging\_pulsar\_admin\_service\_url) | Pulsar admin service URL passed to StreamX Operator. If null and KAAP enabled then KAAP default URL is used. | `string` | `null` | no |
| <a name="input_streamx_operator_messaging_pulsar_client_service_url"></a> [streamx\_operator\_messaging\_pulsar\_client\_service\_url](#input\_streamx\_operator\_messaging\_pulsar\_client\_service\_url) | Pulsar client service URL passed to StreamX Operator. If null and KAAP enabled then KAAP default URL is used. | `string` | `null` | no |
| <a name="input_streamx_operator_monitoring_traces_endpoint"></a> [streamx\_operator\_monitoring\_traces\_endpoint](#input\_streamx\_operator\_monitoring\_traces\_endpoint) | Traces collector URL | `string` | `null` | no |
| <a name="input_streamx_operator_monitoring_traces_mode"></a> [streamx\_operator\_monitoring\_traces\_mode](#input\_streamx\_operator\_monitoring\_traces\_mode) | Traces monitoring mode for StreamX Meshes deployed by StreamX Operator | `string` | `null` | no |
| <a name="input_streamx_operator_namespace"></a> [streamx\_operator\_namespace](#input\_streamx\_operator\_namespace) | The namespace used for the deployment | `string` | `"streamx-operator"` | no |
| <a name="input_streamx_operator_release_name"></a> [streamx\_operator\_release\_name](#input\_streamx\_operator\_release\_name) | The name of the helm release. | `string` | `null` | no |
| <a name="input_streamx_operator_settings"></a> [streamx\_operator\_settings](#input\_streamx\_operator\_settings) | Additional key value settings which will be passed to the Helm chart values, e.g. { "namespace" = "kube-system" }. | `map(any)` | `null` | no |
| <a name="input_streamx_operator_timeout"></a> [streamx\_operator\_timeout](#input\_streamx\_operator\_timeout) | Time in seconds to wait for any individual kubernetes operation. | `number` | `null` | no |
| <a name="input_streamx_operator_values"></a> [streamx\_operator\_values](#input\_streamx\_operator\_values) | A list of values in raw YAML to be applied to the helm release. Overrides default composed values. Merges with the settings input, can also be used with the `file()` function, i.e. `file("my/values.yaml")`. | `list(string)` | `null` | no |
| <a name="input_tempo_chart_name"></a> [tempo\_chart\_name](#input\_tempo\_chart\_name) | The name of the Helm chart to install | `string` | `null` | no |
| <a name="input_tempo_chart_repository"></a> [tempo\_chart\_repository](#input\_tempo\_chart\_repository) | The repository containing the Helm chart to install. | `string` | `null` | no |
| <a name="input_tempo_chart_version"></a> [tempo\_chart\_version](#input\_tempo\_chart\_version) | The version of the Helm chart to install. | `string` | `null` | no |
| <a name="input_tempo_create_namespace"></a> [tempo\_create\_namespace](#input\_tempo\_create\_namespace) | Create a namespace for the deployment. | `bool` | `true` | no |
| <a name="input_tempo_enabled"></a> [tempo\_enabled](#input\_tempo\_enabled) | Enables Tempo. | `bool` | `true` | no |
| <a name="input_tempo_namespace"></a> [tempo\_namespace](#input\_tempo\_namespace) | The namespace used for the deployment | `string` | `"tempo"` | no |
| <a name="input_tempo_release_name"></a> [tempo\_release\_name](#input\_tempo\_release\_name) | The name of the helm release. | `string` | `null` | no |
| <a name="input_tempo_settings"></a> [tempo\_settings](#input\_tempo\_settings) | Additional key value settings which will be passed to the Helm chart values, e.g. { "namespace" = "kube-system" }. | `map(any)` | `null` | no |
| <a name="input_tempo_timeout"></a> [tempo\_timeout](#input\_tempo\_timeout) | Time in seconds to wait for any individual kubernetes operation | `number` | `null` | no |
| <a name="input_tempo_values"></a> [tempo\_values](#input\_tempo\_values) | A list of values in raw YAML to be applied to the helm release. Overrides default values from [default-configs](./default-configs). Merges with the settings input, can also be used with the `file()` function, i.e. `file("my/values.yaml")`. | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cert_manager_lets_encrypt_issuer_ingress_annotations"></a> [cert\_manager\_lets\_encrypt\_issuer\_ingress\_annotations](#output\_cert\_manager\_lets\_encrypt\_issuer\_ingress\_annotations) | Ingress annotations with Cert Manager Let's Encrypt issuer configuration |
| <a name="output_loadbalancer_ip"></a> [loadbalancer\_ip](#output\_loadbalancer\_ip) | K8s cluster Load Balancer IP |
<!-- END_TF_DOCS -->
