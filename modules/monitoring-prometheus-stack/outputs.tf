output "metrics_otlp_endpoint" {
  description = "OTLP endpoint"
  value       = "prometheus-stack-kube-prom-prometheus.${local.namespace}.svc.cluster.local:9090/api/v1/otlp"
}