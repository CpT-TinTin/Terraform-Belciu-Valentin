variable "nic_names" {
  description = "Set of NIC names"
  type = set(string)
  default = [ "IBMnic0","IBMnic1","IBMnic2" ]
  
}
resource "azurerm_network_interface" "nic" {
  for_each = var.nic_names
  name                = each.value
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    
    name                          = "testconfiguration${each.key}"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip[each.key].id
  }
}