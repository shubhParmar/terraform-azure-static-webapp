variable "name" {
  description = "static web page name"
  type = string
  default = "default-name-for-resource-group"
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

variable "tags" {
  description = "tags"
  type = map
  default = {}
}