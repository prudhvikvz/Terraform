module "virtual_network_full" {
  source               = "../../"
  resource_group_name  = var.resource_group_name
  subscription_id      = var.subscription_id
  resource_name        = var.resource_name
  address_prefix       = var.address_prefix
  address_space        = var.address_space
  log_enabled          = var.log_enabled
  metrics_enabled      = var.metrics_enabled
  retention_days       = var.retention_days
  role_definition      = var.role_definition
  log_categories       = var.log_categories
  metric_categories    = var.metric_categories
  service_endpoints    = var.service_endpoints
  storage_account_name = var.storage_account_name
  location             = var.location
}
