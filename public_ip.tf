variable "public_ip_names" {
  description = "Set of public IP names"
  type        = set(string)
  default     = ["IBMpubip0", "IBMpubip1", "IBMpubip2"]
}
resource "azurerm_public_ip" "publicip" {
 for_each = var.public_ip_names
  name                = each.value
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
}