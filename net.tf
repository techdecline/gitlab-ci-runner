resource "azurerm_network_interface" "nic-gitlab" {
  name                = "nic-${local.gitlab_vm_name}"
  resource_group_name = data.azurerm_resource_group.rg-gitlab.name
  location            = data.azurerm_resource_group.rg-gitlab.location

  ip_configuration {
    name                          = "ipconfig0"
    subnet_id                     = var.vm_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}