<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.35.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.35.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_secret.docker_config_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Secret name | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace in which secret is created | `string` | n/a | yes |
| <a name="input_registry_email"></a> [registry\_email](#input\_registry\_email) | Docker registry user email | `string` | n/a | yes |
| <a name="input_registry_password"></a> [registry\_password](#input\_registry\_password) | Docker registry user password | `string` | n/a | yes |
| <a name="input_registry_server"></a> [registry\_server](#input\_registry\_server) | Docker registry server URL | `string` | n/a | yes |
| <a name="input_registry_username"></a> [registry\_username](#input\_registry\_username) | Docker registry user name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_secret_name"></a> [secret\_name](#output\_secret\_name) | Created secret name. |
<!-- END_TF_DOCS -->