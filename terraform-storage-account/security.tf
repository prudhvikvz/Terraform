module "rbac" {
  source = "../terraform-rbac-default/"

  resource_id     = azurerm_storage_account.default.id
  role_definition = var.role_definition
}
