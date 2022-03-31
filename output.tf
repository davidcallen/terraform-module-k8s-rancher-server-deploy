output "rancher_url" {
  value = "https://${var.rancher_server_dns}"
}
output "kube_config_yaml_filename" {
  value = local_file.kube_config_server_yaml.filename
}
output "rancher2_bootstrap_admin_token" {
  value       = rancher2_bootstrap.admin.token
  description = ""
}