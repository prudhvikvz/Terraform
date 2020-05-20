module "rbac" {
  source = "../terraform-rbac-default/"

  resource_id     = azurerm_virtual_machine.default.id
  role_definition = var.role_definition
}