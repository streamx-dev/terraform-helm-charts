output "loadbalancer_ip" {
  description = "K8s cluster Load Balancer IP"
  value       = module.streamx_platform.loadbalancer_ip
}