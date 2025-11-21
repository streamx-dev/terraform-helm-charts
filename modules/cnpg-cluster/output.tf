output "db_username" {
  value = data.kubernetes_secret_v1.cluster_app.data.username
}

output "db_password" {
  value     = data.kubernetes_secret_v1.cluster_app.data.password
  sensitive = true
}

output "db_name" {
  value = data.kubernetes_secret_v1.cluster_app.data.dbname
}