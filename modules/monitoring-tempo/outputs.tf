output "tempo_otlp_endpoint" {
  description = "Tempo service OTLP endpoint"
  value       = "tempo-distributed-distributor-discovery.${local.namespace}.svc.cluster.local:4317"
}