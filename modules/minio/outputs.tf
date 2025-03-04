output "loki_otlp_url" {
  description = "Loki service OTLP endpoint URL"
  value       = "http://loki-write-headless.${local.namespace}.svc.cluster.local:3100/otlp"
}