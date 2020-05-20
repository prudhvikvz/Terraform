module "sql_database" {
  source               = "../"
  resource_group_name  = var.resource_group_name
  subscription_id      = var.subscription_id
  storage_account_name = var.storage_account_name
  resource_name        = var.resource_name
  admin_login          = var.admin_login
  server_version       = var.server_version
  log_enabled          = var.log_enabled
  metrics_enabled      = var.metrics_enabled
  retention_days       = var.retention_days
  role_definition      = var.role_definition
  log_categories       = var.log_categories
  metric_categories    = var.metric_categories
  location             = var.location
}
