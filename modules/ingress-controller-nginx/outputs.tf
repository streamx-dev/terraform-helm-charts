locals {
  load_balancer_ingress = data.kubernetes_service.ingress_svc.status.0.load_balancer.0.ingress
}

output "ingress_ip" {
  description = "IP of the loadbalancer"
  value       = length(local.load_balancer_ingress) > 0 ? local.load_balancer_ingress.0.ip : null
}