variable "force_defaults_for_null_variables" {
  default     = true
  description = "Enables forcing default variable values when the variable value passed to the module is null."
  type        = bool
}

variable "atomic" {
  default     = true
  description = "Purge the chart on a failed installation."
  type        = bool
}

variable "chart_name" {
  default     = "cert-manager"
  description = "The name of the Helm chart to install"
  type        = string
}

variable "chart_repository" {
  default     = "https://charts.jetstack.io"
  description = "The repository containing the Helm chart to install"
  type        = string
}

variable "chart_version" {
  default     = "v1.14.5"
  description = "The version of the Helm chart to install"
  type        = string
}

variable "cleanup_on_fail" {
  default     = true
  description = "Allow deletion of new resources created in this upgrade when upgrade fails"
  type        = bool
}

variable "create_namespace" {
  default     = true
  description = "Create a namespace for the deployment. Defaults to \"true\"."
  type        = bool
}

variable "namespace" {
  default     = "cert-manager"
  description = "The namespace used for the deployment"
  type        = string
}

variable "release_name" {
  default     = "cert-manager"
  description = "The name of the helm release"
  type        = string
}

variable "settings" {
  default     = {}
  description = "Settings which will be passed to the Helm chart values"
  type        = map(any)
}

variable "timeout" {
  default     = 120
  description = "Time in seconds to wait for any individual kubernetes operation"
  type        = number
}

variable "values" {
  default     = []
  description = "A list of values in raw YAML to be applied to the helm release. Merges with the settings input, can also be used with the `file()` function, i.e. `file(\"my/values.yaml\")`."
}