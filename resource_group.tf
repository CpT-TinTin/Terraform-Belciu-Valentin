resource "azurerm_resource_group" "rg" {
    name= "IBM-Resource-Group"
    location = local.region
    lifecycle {
      prevent_destroy = true
    }
  
}