module "key_vault" {
  source                      = "../../"
  resource_group_name         = var.resource_group_name
  subscription_id             = var.subscription_id
  resource_name               = var.resource_name
  key_vault_name              = var.key_vault_name
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  soft_delete_enabled         = var.soft_delete_enabled
  purge_protection_enabled    = var.purge_protection_enabled
  sku                         = var.sku
  default_action              = var.default_action
  storage_account_name        = var.storage_account_name
  log_enabled                 = var.log_enabled
  metrics_enabled             = var.metrics_enabled
  retention_days              = var.retention_days
  role_definition             = var.role_definition
  log_categories              = var.log_categories
  metric_categories           = var.metric_categories
  location                    = var.location
}
