# POC 3
# 1)	Create Modules for Azure Vnet, Azure Subnet, Resource Group and Static Web App.
# 2)	Upload these modules to GitHub Repo.
# 3)	Create calling code with remote Statefile as storage account container.
# 4)	Upload calling code to GitHub.
# 5)	Add these code to Github by Repo name terraform-azure-static-webapp

# creating storage account container for storing tfstate file
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "tfstate" {
  name     = "tfstate"
  location = "East US"
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "tfstate_sa_${random_string.resource_code.result}"
  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = azurerm_resource_group.tfstate.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_nested_items_to_be_public = false

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate_container"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
} 


# creating azure infrastructure
module "resource_group" {
  source   = "./module/resource_group"
  name     = var.resource_group_name
  location = var.resource_group_location
}

module "vnet" {
  source = "./module/vnet"
  name = var.vnet_name
  location = module.resource_group.location
  resource_group_name = module.resource_group.name
  address_space = var.vnet_address_space
  tags = var.tags
}

module "subnet" {
  source = "./module/subnet"
  name = var.subnet_name
  resource_group_name = module.resource_group.name
  virtual_network_name = module.vnet.name
  address_prefixes = var.subnet_address_prefixes
}

module "swa" {
  source = "./module/static_web_app"
  name = var.swa_name
  resource_group_name = module.resource_group.name
  location = module.resource_group.location
  tags = var.tags
}

