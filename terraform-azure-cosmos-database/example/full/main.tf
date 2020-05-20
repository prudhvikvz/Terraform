module "cosmos_db_full" {
  source               = "../../"
  resource_group_name  = var.resource_group_name
  subscription_id      = var.subscription_id
  failover_location    = var.failover_location
  consistency_level    = var.consistency_level
  kind                 = var.kind
  resource_name        = var.resource_name
  storage_account_name = var.storage_account_name
  location             = var.location
  log_enabled         = var.log_enabled
  metrics_enabled     = var.metrics_enabled
  retention_days      = var.retention_days
  role_definition     = var.role_definition
  log_categories      = var.log_categories
  metric_categories   = var.metric_categories
}
