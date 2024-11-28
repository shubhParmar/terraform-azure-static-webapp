resource "azurerm_static_web_app" "s_w_app" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

