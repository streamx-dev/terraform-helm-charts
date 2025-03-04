output "mimir_otlp_endpoint" {
  description = "Mimir service OTLP endpoint"
  value       = "mimir-nginx.${local.namespace}.svc.cluster.local:80/otlp"
}