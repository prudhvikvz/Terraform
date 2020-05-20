module "storage_account" {
  source                   = "../../"
  resource_group_name      = var.resource_group_name
  subscription_id          = var.subscription_id
  resource_name            = var.resource_name
  account_type             = var.account_type
  account_replication_type = var.account_replication_type
  role_definition          = var.role_definition
  location                 = var.location
}
