module "mysql" {
  source              = "../"
  resource_group_name = var.resource_group_name
  subscription_id     = var.subscription_id
  resource_name       = var.resource_name
  admin_login         = var.admin_login
  location            = var.location
  storage_account_name= var.storage_account_name
  log_enabled         = var.log_enabled
  metrics_enabled     = var.metrics_enabled
  retention_days      = var.retention_days
  role_definition     = var.role_definition
  log_categories      = var.log_categories
  metric_categories   = var.metric_categories
}
