variable "vm_names" {
  description = "Set of VM names"
  type = set(string)
  default = [ "MagicVM0","MagicVM1" ]
  
}
resource "azurerm_linux_virtual_machine" "MagicVM" {
  for_each = var.vm_names
  name                = each.value
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B1s"
  admin_username      = "azureuser"
  admin_password = random_password.pass[each.key].result
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-LTS"
    version   = "latest"
  }
      disable_password_authentication = false
  computer_name  = each.value
}
