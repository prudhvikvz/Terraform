provider "azurerm" {
  version = ">2.0.0"
  features {}
}

data "azurerm_client_config" "current" {
}

resource "azurerm_role_assignment" "example" {
  scope                = var.resource_id
  role_definition_name = var.role_definition
  principal_id         = data.azurerm_client_config.current.object_id
}