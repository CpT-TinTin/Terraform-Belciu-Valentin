resource "azurerm_resource_group" "rg" {
    name= "IBM-Resource-Group"
    location = local.region
  
}