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
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | ~> 1.14.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | ~> 1.14.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubectl_manifest.letsencrypt_cert_cluster_issuer](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_force_defaults_for_null_variables"></a> [force\_defaults\_for\_null\_variables](#input\_force\_defaults\_for\_null\_variables) | Enables forcing default variable values when the variable value passed to the module is null. | `bool` | `true` | no |
| <a name="input_issuer_acme_email"></a> [issuer\_acme\_email](#input\_issuer\_acme\_email) | Email passed to acme server. | `string` | n/a | yes |
| <a name="input_issuer_ingress_class"></a> [issuer\_ingress\_class](#input\_issuer\_ingress\_class) | Cluster Issuer Ingress class name | `string` | `"nginx"` | no |
| <a name="input_name"></a> [name](#input\_name) | Cluster Issuer name | `string` | `"letsencrypt-cert-cluster-issuer"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | K8s namespace in which Cert Manager Let's Encrypt cluster issuer is installed | `string` | `"cert-manager"` | no |
| <a name="input_prod_letsencrypt_server"></a> [prod\_letsencrypt\_server](#input\_prod\_letsencrypt\_server) | Determines if created Cluster Issuer should use prod or staging acme server. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_issuer_ingress_annotations"></a> [cluster\_issuer\_ingress\_annotations](#output\_cluster\_issuer\_ingress\_annotations) | Ingress annotations with cert manager configuration |
<!-- END_TF_DOCS -->
