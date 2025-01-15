output "loadbalancer_ip" {
  description = "K8s cluster Load Balancer IP"
  value       = length(module.ingress_controller_nginx) > 0 ? module.ingress_controller_nginx[0].ingress_ip : null
}