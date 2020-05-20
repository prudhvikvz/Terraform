provider "azurerm" {
  version = ">2.0.0"
  features {}
}

data "azurerm_monitor_diagnostic_categories" "current" {
  resource_id = var.resource_id
}

locals {
  logs = {
    for category in var.log_categories : category => {
      enabled        = var.log_enabled
      retention_days = var.retention_days
    }
  }

  metrics = {
    for metric in var.metric_categories : metric => {
      enabled        = var.metrics_enabled
      retention_days = var.retention_days
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "default" {
  name               = "${var.resource_name}-diag-settings"
  target_resource_id = var.resource_id
  storage_account_id = var.storage_account_id

  dynamic "log" {
    for_each = local.logs

    content {
      category = log.key
      enabled  = log.value.enabled

      retention_policy {
        enabled = log.value.retention_days != null ? true : false
        days    = log.value.retention_days
      }
    }
  }

  dynamic "metric" {
    for_each = local.metrics

    content {
      category = metric.key
      enabled  = metric.value.enabled

      retention_policy {
        enabled = metric.value.retention_days != null ? true : false
        days    = metric.value.retention_days
      }
    }
  }
}
