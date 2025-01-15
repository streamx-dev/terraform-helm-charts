output "client_service_url" {
  description = "Pulsar client service URL"
  value = "pulsar://pulsar-broker.${local.namespace}.svc.cluster.local:6650"
}

output "admin_service_url" {
  description = "Pulsar admin service URL"
  value = "http://pulsar-broker.${local.namespace}.svc.cluster.local:8080"
}