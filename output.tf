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
//output "rancher_server_aws_cloud_credential_name" {
//  value = rancher2_cloud_credential.aws.name
//}