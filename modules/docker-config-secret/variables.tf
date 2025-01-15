variable "name" {
  description = "Secret name"
  type = string
}
variable "namespace" {
  description = "Namespace in which secret is created"
  type = string
}
variable "registry_server" {
  description = "Docker registry server URL"
  type = string
}
variable "registry_username" {
  description = "Docker registry user name"
  type = string
}
variable "registry_password" {
  description = "Docker registry user password"
  type = string
  sensitive = true
}
variable "registry_email" {
  description = "Docker registry user email"
  type = string
}