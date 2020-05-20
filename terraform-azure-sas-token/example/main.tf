module "sas_token" {
  source               = "../"
  resource_group_name  = var.resource_group_name
  subscription_id      = var.subscription_id
  resource_name        = var.resource_name
  storage_account_name = var.storage_account_name
  read                 = var.read
  write                = var.write
  delete               = var.delete
  list                 = var.list
  add                  = var.add
  create               = var.create
  update               = var.update
  process              = var.process
  days                 = var.days
}
