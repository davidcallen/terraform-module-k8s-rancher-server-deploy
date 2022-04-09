# Rancher resources

# Initialize Rancher server
resource "rancher2_bootstrap" "admin" {
  depends_on = [
    helm_release.rancher_server
  ]
  provider  = rancher2.bootstrap
  password  = var.rancher_server_bootstrap_admin_password
  telemetry = true
}
//# Create a new rancher2 Cloud Credential
//resource "rancher2_cloud_credential" "aws" {
//  provider    = rancher2.bootstrap
//  name        = "aws-rancher-user"
//  description = "AWS credential"
//  amazonec2_credential_config {
//    access_key     = var.aws_user_credential_access_key
//    secret_key     = var.aws_user_credential_secret_key
//    default_region = var.aws_region
//  }
//}