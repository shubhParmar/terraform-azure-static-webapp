terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }

  backend "azurerm" {
      resource_group_name  = var.tfstate_resource_group_name
      storage_account_name = var.tfstate_storage_account_name
      container_name       = var.tfstate_container_name
      key                  = var.tfstate_file_name_key
  }

}

provider "azurerm" {
  features {}
  client_id = var.azurerm_client-id
  client_secret = var.azurerm_client-secret
  subscription_id = var.azurerm_subscription
  tenant_id = var.azurerm_tenant
}