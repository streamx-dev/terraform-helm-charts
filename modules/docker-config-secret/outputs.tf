output "secret_name" {
  description = "Created secret name."
  value       = kubernetes_secret.docker_config_secret.metadata[0].name
}