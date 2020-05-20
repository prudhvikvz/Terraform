module "diag_settings" {
  source = "../terraform-azure-diagnostic-settings/"

  resource_name      = var.resource_name
  resource_id        = azurerm_network_security_group.default.id
  log_enabled        = var.log_enabled
  metrics_enabled    = var.metrics_enabled
  retention_days     = var.retention_days
  storage_account_id = data.azurerm_storage_account.current.id
  log_categories     = var.log_categories
  metric_categories  = var.metric_categories
}

module "rbac" {
  source = "../terraform-rbac-default/"

  resource_id     = azurerm_network_security_group.default.id
  role_definition = var.role_definition
}
