module "storage_account" {
  source                   = "../../"
  resource_group_name      = var.resource_group_name
  subscription_id          = var.subscription_id
  resource_name            = var.resource_name
  subnet_name              = var.subnet_name
  virtual_network_name     = var.virtual_network_name
  location                 = var.location
  account_type             = var.account_type
  account_replication_type = var.account_replication_type
  role_definition          = var.role_definition
  default_action           = var.default_action
  ip_rules                 = var.ip_rules
}
