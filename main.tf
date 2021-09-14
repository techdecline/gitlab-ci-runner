terraform {
  required_providers {
    azurerm = {
      version = ">= 2.75.0"
    }
  }
}

locals {
  gitlab_vm_name = substr("${var.gitlab_vm_name}${random_string.guid.result}", 0, 15)
}

resource "random_string" "guid" {
  length  = 16
  special = false
  upper   = false
}

data "azurerm_resource_group" "rg-gitlab" {
  name = var.resource_group_name
}

data "template_file" "init-gitlab" {
  template = file("${path.module}/scripts/init.sh")
  vars = {
    REGISTRATION_TOKEN    = var.registration_token
    GITLAB_URL            = var.gitlab_url
  }
}