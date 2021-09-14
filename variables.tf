variable "gitlab_vm_name" {
  type        = string
  description = "Name for the GitLab Virtual Machine"
}

variable "key_vault_id" {
  type        = string
  description = "Key Vault ID for the SSH Keys"
  default = ""
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name for GitLab resources"
}

variable "vm_subnet_id" {
  type        = string
  description = "Subnet ID for the GitLab Virtual Machine"
}

variable "vm_size" {
  type        = string
  description = "Azure Virtual Machine SKU for Gitlab Virtual Machine"
  default     = "Standard_DS2_v2"
}

variable "registration_token" {
  type = string
  description = "Registration Token for GitLab Runner"
}

variable "gitlab_url" {
  type = string
  description = "GitLab Server URL"
}

variable "ssh_public_key" {
  type = string
  description = "Existing SSH Public Key for authentication"
  default = ""
}