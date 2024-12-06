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
  client_id = data.azurerm_key_vault_secret.client_id.name
  client_secret = data.azurerm_key_vault_secret.client_secret.name
  subscription_id = data.azurerm_key_vault_secret.subs_id
  tenant_id = data.azurerm_key_vault_secret.tenant_id
}
