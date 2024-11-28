variable "name" {
  description = "virtual network name"
  type = string
  default = ""
}

variable "resource_group_name" {
  description = "resource group name"
  type = string
  default = ""
}

variable "location" {
  description = "location"
  type = string
  default = ""
}

variable "address_space" {
  description = "address space"
  type = list()
  default = []
}

variable "tags" {
  description = "tags"
  type = map
  default = {}
}




