data "azurerm_key_vault" "key_vault" {
  name                = "$$mykeyvault"
  resource_group_name = "$$some-resource-group-already-created"
}

data "azurerm_key_vault_secret" "client_id" {
  name         = "$$client_id(created on console)"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}
data "azurerm_key_vault_secret" "client_secret" {
  name         = "$$client_secret(created on console)"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}
data "azurerm_key_vault_secret" "subs_id" {
  name         = "$$subs_id(created on console)"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}
data "azurerm_key_vault_secret" "tenant_id" {
  name         = "$$tenant_id(created on console)"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}


# #OR this can be done through looping
# data "azurerm_key_vault_secrets" "secrets" {
#   key_vault_id = data.azurerm_key_vault.key_vault.id
# }

# data "azurerm_key_vault_secret" "secrets" {
#   for_each     = toset(data.azurerm_key_vault_secrets.secrets.names)
#   name         = each.key
#   key_vault_id = data.azurerm_key_vault.key_vault.id
# }
