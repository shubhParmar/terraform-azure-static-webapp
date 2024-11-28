# provider
variable "azurerm_client-id" {
  description = "client id"
  type = string
  default = ""
}

variable "azurerm_client-secret" {
  description = "client secret id"
  type = string
  default = ""
}

variable "azurerm_subscription" {
  description = "subscription id"
  type = string
  default = ""
}

variable "azurerm_tenant" {
  description = "tenant id"
  type = string
  default = ""
}

variable "tfstate_resource_group_name" {
  description = "resource group name created on portal"
  type = string
  default = ""
}

variable "tfstate_storage_account_name" {
  description = "storage account name created on portal"
  type = string
  default = ""
}

variable "tfstate_container_name" {
  description = "container name created on portal"
  type = string
  default = ""
}

variable "tfstate_file_name_key" {
  description = "state file name"
  type = string
  default = ""
}

# main
variable "resource_group_name" {
  description = "resource group name"
  type = string
  default = ""
}

variable "resource_group_location" {
  description = "resource group location"
  type = string
  default = ""
}

variable "vnet_name" {
  description = "virtual network name"
  type = string
  default = ""
}

variable "vnet_address_space" {
  description = "virtual network address space"
  type = map
  default = []
}

variable "tags" {
  description = "tags"
  type = map
  default = []
}

variable "subnet_name" {
  description = "subnet name"
  type = string
  default = ""
}

variable "subnet_address_prefixes" {
  description = "subnet address prefixes"
  type = map
  default = []
}

variable "swa_name" {
  description = "static web app name"
  type = string
  default = ""
}