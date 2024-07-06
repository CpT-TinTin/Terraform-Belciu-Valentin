terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.2"
    }
  }
backend "azurerm" {
subscription_id="350b4fdf-dc47-4dab-abee-d91ddd9db028"
  resource_group_name   = "IBM-Resource-Group"
  storage_account_name  = "ibmstorages"
  container_name        = "ibm"
  key                   = "terraform.tfstate"
  use_azuread_auth      = true
}
}
provider "azurerm" {
  features {
    
  }
}

