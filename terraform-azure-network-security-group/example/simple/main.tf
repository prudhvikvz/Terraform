module "nsg_full" {
  source               = "../../"
  resource_group_name  = var.resource_group_name
  subscription_id      = var.subscription_id
  resource_name        = var.resource_name
  subnet_name          = var.subnet_name
  virtual_network_name = var.virtual_network_name
  allocation_method    = var.allocation_method
  log_enabled          = var.log_enabled
  metrics_enabled      = var.metrics_enabled
  retention_days       = var.retention_days
  role_definition      = var.role_definition
  log_categories       = var.log_categories
  metric_categories    = var.metric_categories
  storage_account_name = var.storage_account_name
  location             = var.location
  predefined_rules = [
    {
      name = var.rule_protocol
    },
  ]

  custom_rules               = var.custom_rules
  source_address_prefix      = var.source_address_prefix
  destination_address_prefix = var.destination_address_prefix
}
