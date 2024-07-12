resource "azurerm_container_registry" "container_registry" {
    name = "IBMContainer"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    sku = "Basic"
    admin_enabled = true
  
}
data "azurerm_container_registry" "container_registry" {
    name = azurerm_container_registry.container_registry.name
    resource_group_name = azurerm_resource_group.rg.name
  
}

