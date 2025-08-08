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

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.17.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.kaap](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_atomic"></a> [atomic](#input\_atomic) | Purge the chart on a failed installation. Default's to "true". | `bool` | `true` | no |
| <a name="input_chart_name"></a> [chart\_name](#input\_chart\_name) | The name of the Helm chart to install | `string` | `"kaap"` | no |
| <a name="input_chart_repository"></a> [chart\_repository](#input\_chart\_repository) | The repository containing the Helm chart to install | `string` | `"https://datastax.github.io/kaap"` | no |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | The version of the Helm chart to install | `string` | `"0.2.1"` | no |
| <a name="input_cleanup_on_fail"></a> [cleanup\_on\_fail](#input\_cleanup\_on\_fail) | Allow deletion of new resources created in this upgrade when upgrade fails | `bool` | `true` | no |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | Create a namespace for the deployment. Defaults to "true". | `bool` | `true` | no |
| <a name="input_force_defaults_for_null_variables"></a> [force\_defaults\_for\_null\_variables](#input\_force\_defaults\_for\_null\_variables) | Enables forcing default variable values when the variable value passed to the module is null. | `bool` | `true` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | The namespace used for the deployment | `string` | `"kaap"` | no |
| <a name="input_release_name"></a> [release\_name](#input\_release\_name) | The name of the helm release | `string` | `"kaap"` | no |
| <a name="input_settings"></a> [settings](#input\_settings) | Settings which will be passed to the Helm chart values | `map(any)` | `{}` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | Time in seconds to wait for any individual kubernetes operation | `number` | `300` | no |
| <a name="input_values"></a> [values](#input\_values) | A list of values in raw YAML to be applied to the helm release. Merges with the settings input, can also be used with the `file()` function, i.e. `file("my/values.yaml")`. | `list` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_service_url"></a> [admin\_service\_url](#output\_admin\_service\_url) | Pulsar admin service URL |
| <a name="output_client_service_url"></a> [client\_service\_url](#output\_client\_service\_url) | Pulsar client service URL |
<!-- END_TF_DOCS -->
