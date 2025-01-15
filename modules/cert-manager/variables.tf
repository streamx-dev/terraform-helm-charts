variable "atomic" {
  default     = null
  description = "Purge the chart on a failed installation. Default's to \"true\"."
  type        = bool
}

variable "chart_name" {
  default     = null
  description = "The name of the Helm chart to install"
  type        = string
}

variable "chart_repository" {
  default     = null
  description = "The repository containing the Helm chart to install"
  type        = string
}

variable "chart_version" {
  default     = null
  description = "The version of the Helm chart to install"
  type        = string
}

variable "cleanup_on_fail" {
  default     = null
  description = "Allow deletion of new resources created in this upgrade when upgrade fails"
  type        = bool
}

variable "create_namespace" {
  default     = null
  description = "Create a namespace for the deployment. Defaults to \"true\"."
  type        = bool
}

variable "namespace" {
  default     = null
  description = "The namespace used for the deployment"
  type        = string
}

variable "release_name" {
  default     = null
  description = "The name of the helm release"
  type        = string
}

variable "settings" {
  default     = null
  description = "Settings which will be passed to the Helm chart values"
  type        = map(any)
}

variable "timeout" {
  default     = null
  description = "Time in seconds to wait for any individual kubernetes operation"
  type        = number
}

variable "values" {
  default     = null
  description = "A list of values in raw YAML to be applied to the helm release. Merges with the settings input, can also be used with the `file()` function, i.e. `file(\"my/values.yaml\")`."
}