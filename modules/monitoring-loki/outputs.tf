output "loki_otlp_endpoint" {
  description = "Loki service OTLP endpoint"
  value       = "loki-write-headless.${local.namespace}.svc.cluster.local:3100/otlp"
}