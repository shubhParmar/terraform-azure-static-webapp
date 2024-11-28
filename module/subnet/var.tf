variable "name" {
  description = "subnet name"
  type = string
  default = "default-name-for-resource-group"
}

variable "resource_group_name" {
  description = "resource group name"
  type = string
  default = ""
}

variable "virtual_network_name" {
  description = "virtuak network name"
  type = string
  default = ""
}

variable "address_prefixes" {
  description = "address prefixes"
  type = list()
  default = []
}