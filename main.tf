# For POC details,see readme.md

# creating azure infrastructure for POC
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

