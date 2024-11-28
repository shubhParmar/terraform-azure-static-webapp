variable "name" {
  description = "name for resource group"
  type = string
  default = "default-name-for-resource-group"
}

variable "location" {
  description = "location for resource group"
  type = string
  default = ""
}

variable "tags" {
  description = "tags"
  type = map
  default = {}
}