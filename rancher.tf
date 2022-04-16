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

# Create a new rancher2 Auth Config for OKTA IdP
resource "rancher2_auth_config_okta" "okta" {
  count                = (length(var.okta_auth_idp_metadata_content) > 0) ? 1 : 0
  user_name_field      = "userName"
  display_name_field   = "displayName"
  groups_field         = "groups"
  idp_metadata_content = var.okta_auth_idp_metadata_content
  rancher_api_host     = "https://${var.rancher_server_dns}/v1-saml/okta/saml/acs"
  sp_cert              = "<SP_CERT>"
  sp_key               = "<SP_KEY>"
  uid_field            = "userName"
  enabled              = true
}