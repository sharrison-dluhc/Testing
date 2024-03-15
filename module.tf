resource "azurerm_log_analytics_workspace" "workspace" {
  name                = local.resource_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  retention_in_days   = var.data_retention_days
  tags                = local.combined_tags
}

resource "azurerm_management_lock" "lock" {
  count = "${var.workspace_lock_level}" == "CanNotDelete" || "${var.workspace_lock_level}" == "ReadOnly" ? 1 : 0

  name       = "${local.resource_name}-lock-${var.workspace_lock_level}"
  scope      = azurerm_log_analytics_workspace.workspace.id
  lock_level = var.workspace_lock_level

}

resource "azurerm_log_analytics_solution" "solution" {
  for_each = try(var.solutions, {})

  solution_name         = each.key
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.workspace.id
  workspace_name        = azurerm_log_analytics_workspace.workspace.name

  plan {
    publisher      = each.value["publisher"]
    product        = each.value["product"]
    promotion_code = try(each.value["promotion_code"], null)
  }
}

resource "azurerm_log_analytics_datasource_windows_performance_counter" "main" {
  for_each = var.windows_performance_counters

  name                = each.key
  resource_group_name = var.resource_group_name
  workspace_name      = azurerm_log_analytics_workspace.workspace.name
  object_name         = each.value["object_name"]
  instance_name       = each.value["instance_name"]
  counter_name        = each.value["counter_name"]
  interval_seconds    = each.value["interval_seconds"]
}

resource "azurerm_log_analytics_datasource_windows_event" "main" {
  for_each = var.windows_event_logs

  name                = each.value["event_log_name"]
  resource_group_name = var.resource_group_name
  workspace_name      = azurerm_log_analytics_workspace.workspace.name
  event_log_name      = each.value["event_log_name"]
  event_types         = each.value["event_types"]
}

resource "azurerm_sentinel_data_connector_azure_active_directory" "main" {
  for_each = { for key, value in var.solutions : key => value
    if value.product == "OMSGallery/SecurityInsights" && var.azure_ad_data_connector_enabled == true
  }

  name                       = "${var.data_connector_prefix}-azure-active-directory"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.workspace.id
}

resource "azurerm_sentinel_data_connector_azure_advanced_threat_protection" "main" {
  for_each = { for key, value in var.solutions : key => value
    if value.product == "OMSGallery/SecurityInsights" && var.azure_advanced_threat_protection_data_connector_enabled == true
  }

  name                       = "${var.data_connector_prefix}-azure-advanced-threat-protection"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.workspace.id
}

resource "azurerm_sentinel_data_connector_azure_security_center" "main" {
  for_each = { for key, value in var.solutions : key => value
    if value.product == "OMSGallery/SecurityInsights" && var.azure_security_center_data_connector_enabled
  }

  name                       = "${var.data_connector_prefix}-azure-security-center"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.workspace.id
}

resource "azurerm_sentinel_data_connector_microsoft_cloud_app_security" "main" {
  for_each = { for key, value in var.solutions : key => value
    if value.product == "OMSGallery/SecurityInsights" && var.cloud_app_security_data_connector_enabled
  }

  name                       = "${var.data_connector_prefix}-cloud-app-security"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.workspace.id
}

resource "azurerm_sentinel_data_connector_microsoft_defender_advanced_threat_protection" "main" {
  for_each = { for key, value in var.solutions : key => value
    if value.product == "OMSGallery/SecurityInsights" && var.defender_advanced_threat_protection_data_connector_enabled
  }

  name                       = "${var.data_connector_prefix}-microsoft-defender-atp"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.workspace.id
}

resource "azurerm_sentinel_data_connector_microsoft_threat_protection" "main" {
  for_each = { for key, value in var.solutions : key => value
    if value.product == "OMSGallery/SecurityInsights" && var.sentinel_data_connector_microsoft_threat_protection_enabled
  }

  name                       = "${var.data_connector_prefix}-microsoft-threat-protection"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.workspace.id
}

resource "azurerm_sentinel_data_connector_office_365" "main" {
  for_each = { for key, value in var.solutions : key => value
    if value.product == "OMSGallery/SecurityInsights" && var.office_365_data_connector_enabled
  }

  name                       = "${var.data_connector_prefix}-office-365"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.workspace.id
}

resource "azurerm_sentinel_data_connector_office_atp" "main" {
  for_each = { for key, value in var.solutions : key => value
    if value.product == "OMSGallery/SecurityInsights" && var.office_365_defender_data_connector_enabled
  }

  name                       = "${var.data_connector_prefix}-office-atp"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.workspace.id
}

resource "azurerm_sentinel_data_connector_aws_s3" "AWS-S3-Digital-CloudTrail" {
  for_each = { for key, value in var.solutions : key => value
    if value.product == "OMSGallery/SecurityInsights" && var.sentinel_aws_s3_settings_digital_cloudtrail_enabled
  }

  name                       = "${var.data_connector_prefix}-AWS-S3-Digital-CloudTrail"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.workspace.id

  aws_role_arn      = var.sentinel_aws_s3_settings_digital_cloudtrail.aws_role_arn
  destination_table = var.sentinel_aws_s3_settings_digital_cloudtrail.destination_table
  sqs_urls          = var.sentinel_aws_s3_settings_digital_cloudtrail.sqs_urls

}

resource "azurerm_sentinel_data_connector_aws_s3" "AWS-S3-Digital-GuardDuty" {
  for_each = { for key, value in var.solutions : key => value
    if value.product == "OMSGallery/SecurityInsights" && var.sentinel_aws_s3_settings_digital_guardduty_enabled
  }

  name                       = "${var.data_connector_prefix}-AWS-S3-Digital-GuardDuty"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.workspace.id

  aws_role_arn      = var.sentinel_aws_s3_settings_digital_guardduty.aws_role_arn
  destination_table = var.sentinel_aws_s3_settings_digital_guardduty.destination_table
  sqs_urls          = var.sentinel_aws_s3_settings_digital_guardduty.sqs_urls

}

resource "azurerm_sentinel_data_connector_aws_s3" "AWS-S3-Digital-VPCFlow" {
  for_each = { for key, value in var.solutions : key => value
    if value.product == "OMSGallery/SecurityInsights" && var.sentinel_aws_s3_settings_digital_vpcflow_enabled
  }

  name                       = "${var.data_connector_prefix}-AWS-S3-Digital-VPCFlow"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.workspace.id

  aws_role_arn      = var.sentinel_aws_s3_settings_digital_vpcflow.aws_role_arn
  destination_table = var.sentinel_aws_s3_settings_digital_vpcflow.destination_table
  sqs_urls          = var.sentinel_aws_s3_settings_digital_vpcflow.sqs_urls

}

resource "azurerm_sentinel_data_connector_aws_s3" "AWS-S3-SAP-CloudTrail" {
  for_each = { for key, value in var.solutions : key => value
    if value.product == "OMSGallery/SecurityInsights" && var.sentinel_aws_s3_settings_SAP_cloudtrail_enabled
  }

  name                       = "${var.data_connector_prefix}-AWS-S3-SAP-CloudTrail"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.workspace.id

  aws_role_arn      = var.sentinel_aws_s3_settings_SAP_cloudtrail.aws_role_arn
  destination_table = var.sentinel_aws_s3_settings_SAP_cloudtrail.destination_table
  sqs_urls          = var.sentinel_aws_s3_settings_SAP_cloudtrail.sqs_urls

}

resource "azurerm_sentinel_data_connector_aws_s3" "AWS-S3-SAP-GuardDuty" {
  for_each = { for key, value in var.solutions : key => value
    if value.product == "OMSGallery/SecurityInsights" && var.sentinel_aws_s3_settings_SAP_guardduty_enabled
  }

  name                       = "${var.data_connector_prefix}-AWS-S3-SAP-GuardDuty"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.workspace.id

  aws_role_arn      = var.sentinel_aws_s3_settings_SAP_guardduty.aws_role_arn
  destination_table = var.sentinel_aws_s3_settings_SAP_guardduty.destination_table
  sqs_urls          = var.sentinel_aws_s3_settings_SAP_guardduty.sqs_urls

}

resource "azurerm_sentinel_data_connector_aws_s3" "AWS-S3-SAP-VPCFlow" {
  for_each = { for key, value in var.solutions : key => value
    if value.product == "OMSGallery/SecurityInsights" && var.sentinel_aws_s3_settings_SAP_vpcflow_enabled
  }

  name                       = "${var.data_connector_prefix}-AWS-S3-SAP-VPCFlow"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.workspace.id

  aws_role_arn      = var.sentinel_aws_s3_settings_SAP_vpcflow.aws_role_arn
  destination_table = var.sentinel_aws_s3_settings_SAP_vpcflow.destination_table
  sqs_urls          = var.sentinel_aws_s3_settings_SAP_vpcflow.sqs_urls

}

resource "azurerm_sentinel_data_connector_aws_s3" "AWS-S3-IER-CloudTrail" {
  for_each = { for key, value in var.solutions : key => value
    if value.product == "OMSGallery/SecurityInsights" && var.sentinel_aws_s3_settings_ier_cloudtrail_enabled
  }

  name                       = "${var.data_connector_prefix}-AWS-S3-IER-CloudTrail"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.workspace.id

  aws_role_arn      = var.sentinel_aws_s3_settings_ier_cloudtrail.aws_role_arn
  destination_table = var.sentinel_aws_s3_settings_ier_cloudtrail.destination_table
  sqs_urls          = var.sentinel_aws_s3_settings_ier_cloudtrail.sqs_urls

}
