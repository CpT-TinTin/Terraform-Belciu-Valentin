resource "azurerm_public_ip" "publicip" {
  count               = 3
  name                = "IBMpubip${count.index}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
}