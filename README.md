<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.1 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.17.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | ~> 1.14.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.35.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.35.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cert_manager"></a> [cert\_manager](#module\_cert\_manager) | ./modules/cert-manager | n/a |
| <a name="module_cert_manager_lets_encrypt_issuer"></a> [cert\_manager\_lets\_encrypt\_issuer](#module\_cert\_manager\_lets\_encrypt\_issuer) | ./modules/cert-manager-issuer-lets-encrypt | n/a |
| <a name="module_ingress_controller_nginx"></a> [ingress\_controller\_nginx](#module\_ingress\_controller\_nginx) | ./modules/ingress-controller-nginx | n/a |
| <a name="module_pulsar_kaap"></a> [pulsar\_kaap](#module\_pulsar\_kaap) | ./modules/pulsar-kaap | n/a |
| <a name="module_streamx_operator"></a> [streamx\_operator](#module\_streamx\_operator) | ./modules/streamx-operator | n/a |
| <a name="module_streamx_operator_image_pull_secret"></a> [streamx\_operator\_image\_pull\_secret](#module\_streamx\_operator\_image\_pull\_secret) | ./modules/docker-config-secret | n/a |

## Resources

| Name | Type |
|------|------|
| [kubernetes_namespace.streamx_operator](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |

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
| <a name="input_ingress_controller_nginx_chart_name"></a> [ingress\_controller\_nginx\_chart\_name](#input\_ingress\_controller\_nginx\_chart\_name) | The name of the Helm chart to install | `string` | `null` | no |
| <a name="input_ingress_controller_nginx_chart_repository"></a> [ingress\_controller\_nginx\_chart\_repository](#input\_ingress\_controller\_nginx\_chart\_repository) | The repository containing the Helm chart to install. | `string` | `null` | no |
| <a name="input_ingress_controller_nginx_chart_version"></a> [ingress\_controller\_nginx\_chart\_version](#input\_ingress\_controller\_nginx\_chart\_version) | The version of the Helm chart to install. | `string` | `null` | no |
| <a name="input_ingress_controller_nginx_create_namespace"></a> [ingress\_controller\_nginx\_create\_namespace](#input\_ingress\_controller\_nginx\_create\_namespace) | Create a namespace for the deployment. | `bool` | `null` | no |
| <a name="input_ingress_controller_nginx_enabled"></a> [ingress\_controller\_nginx\_enabled](#input\_ingress\_controller\_nginx\_enabled) | Enables NGINX Ingress Controller. | `bool` | `true` | no |
| <a name="input_ingress_controller_nginx_namespace"></a> [ingress\_controller\_nginx\_namespace](#input\_ingress\_controller\_nginx\_namespace) | The namespace used for the deployment | `string` | `null` | no |
| <a name="input_ingress_controller_nginx_release_name"></a> [ingress\_controller\_nginx\_release\_name](#input\_ingress\_controller\_nginx\_release\_name) | The name of the helm release. | `string` | `null` | no |
| <a name="input_ingress_controller_nginx_settings"></a> [ingress\_controller\_nginx\_settings](#input\_ingress\_controller\_nginx\_settings) | Additional key value settings which will be passed to the Helm chart values, e.g. { "namespace" = "kube-system" }. | `map(any)` | `null` | no |
| <a name="input_ingress_controller_nginx_timeout"></a> [ingress\_controller\_nginx\_timeout](#input\_ingress\_controller\_nginx\_timeout) | Time in seconds to wait for any individual kubernetes operation | `number` | `null` | no |
| <a name="input_ingress_controller_nginx_values"></a> [ingress\_controller\_nginx\_values](#input\_ingress\_controller\_nginx\_values) | A list of values in raw YAML to be applied to the helm release. Overrides default values from [default-configs](./default-configs). Merges with the settings input, can also be used with the `file()` function, i.e. `file("my/values.yaml")`. | `list(string)` | `null` | no |
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
| <a name="input_streamx_operator_messaging_pulsar_admin_service_url"></a> [streamx\_operator\_messaging\_pulsar\_admin\_service\_url](#input\_streamx\_operator\_messaging\_pulsar\_admin\_service\_url) | Pulsar admin service URL passed to StreamX Operator if KAAP is disabled. | `string` | `null` | no |
| <a name="input_streamx_operator_messaging_pulsar_client_service_url"></a> [streamx\_operator\_messaging\_pulsar\_client\_service\_url](#input\_streamx\_operator\_messaging\_pulsar\_client\_service\_url) | Pulsar client service URL passed to StreamX Operator if KAAP is disabled. | `string` | `null` | no |
| <a name="input_streamx_operator_messaging_pulsar_init_image"></a> [streamx\_operator\_messaging\_pulsar\_init\_image](#input\_streamx\_operator\_messaging\_pulsar\_init\_image) | Pulsar Tenant Init container image. | `string` | `"ghcr.io/streamx-dev/streamx/pulsar-init:latest-jvm"` | no |
| <a name="input_streamx_operator_monitoring_traces_enabled"></a> [streamx\_operator\_monitoring\_traces\_enabled](#input\_streamx\_operator\_monitoring\_traces\_enabled) | Enables traces monitoring for StreamX Meshes deployed by StreamX Operator | `bool` | `false` | no |
| <a name="input_streamx_operator_monitoring_traces_endpoint"></a> [streamx\_operator\_monitoring\_traces\_endpoint](#input\_streamx\_operator\_monitoring\_traces\_endpoint) | Traces collector URL | `string` | `null` | no |
| <a name="input_streamx_operator_namespace"></a> [streamx\_operator\_namespace](#input\_streamx\_operator\_namespace) | The namespace used for the deployment | `string` | `"streamx-operator"` | no |
| <a name="input_streamx_operator_release_name"></a> [streamx\_operator\_release\_name](#input\_streamx\_operator\_release\_name) | The name of the helm release. | `string` | `null` | no |
| <a name="input_streamx_operator_settings"></a> [streamx\_operator\_settings](#input\_streamx\_operator\_settings) | Additional key value settings which will be passed to the Helm chart values, e.g. { "namespace" = "kube-system" }. | `map(any)` | `null` | no |
| <a name="input_streamx_operator_timeout"></a> [streamx\_operator\_timeout](#input\_streamx\_operator\_timeout) | Time in seconds to wait for any individual kubernetes operation. | `number` | `null` | no |
| <a name="input_streamx_operator_values"></a> [streamx\_operator\_values](#input\_streamx\_operator\_values) | A list of values in raw YAML to be applied to the helm release. Overrides default composed values. Merges with the settings input, can also be used with the `file()` function, i.e. `file("my/values.yaml")`. | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_loadbalancer_ip"></a> [loadbalancer\_ip](#output\_loadbalancer\_ip) | K8s cluster Load Balancer IP |
<!-- END_TF_DOCS -->