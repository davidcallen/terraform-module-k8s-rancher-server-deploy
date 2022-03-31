variable "node_public_ip" {
  type        = string
  description = "Public IP of compute node for Rancher Server cluster"
}
variable "node_internal_ip" {
  type        = string
  description = "Internal IP of compute node for Rancher Server cluster"
  default     = ""
}
variable "node_username" {
  type        = string
  description = "Username used for SSH access to the Rancher Server cluster node"
  validation {
    condition     = length(var.node_username) > 0
    error_message = "Error : the variable 'node_username' must be non-empty."
  }
}
variable "cluster_ssh_private_key_filename" {
  type        = string
  description = "FilePathName of SSH Private Key to be used to connect to cluster."
  validation {
    condition     = length(var.cluster_ssh_private_key_filename) > 0
    error_message = "Error : the variable 'cluster_ssh_private_key_filename' must be non-empty."
  }
}
variable "rancher_kubernetes_version" {
  type        = string
  description = "Kubernetes version to use for Rancher server cluster"
  default     = "v1.21.8+k3s1"
}
variable "cert_manager_version" {
  type        = string
  description = "Version of cert-manager to install alongside Rancher (format: 0.0.0)"
  default     = "1.5.3"
}
variable "rancher_version" {
  type        = string
  description = "Rancher server version (format v0.0.0)"
  default     = "v2.6.3"
}
variable "rancher_server_dns" {
  type        = string
  description = "DNS host name of the Rancher server"
  validation {
    condition     = length(var.rancher_server_dns) > 0
    error_message = "Error : the variable 'rancher_server_dns' must be non-empty."
  }
}
variable "rancher_server_bootstrap_admin_password" {
  type        = string
  description = "Admin password to use for Rancher server bootstrap"
  validation {
    condition     = length(var.rancher_server_bootstrap_admin_password) > 0
    error_message = "Error : the variable 'rancher_server_bootstrap_admin_password' must be non-empty."
  }
}
