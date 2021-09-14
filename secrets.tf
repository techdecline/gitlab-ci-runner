resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "azurerm_key_vault_secret" "secret-gitlab-priv" {
  count        = length(var.key_vault_id) > 0 ? 1 : 0  
  name         = "${local.gitlab_vm_name}-priv"
  value        = tls_private_key.ssh.private_key_pem
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "secret-gitlab-pub" {
  count        = length(var.key_vault_id) > 0 ? 1 : 0 
  name         = "${local.gitlab_vm_name}-pub"
  value        = tls_private_key.ssh.public_key_openssh
  key_vault_id = var.key_vault_id
}