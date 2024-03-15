variable "resource_prefix" {
  type    = string
  default = "law"
}

variable "data_connector_prefix" {
  type    = string
  default = "asdc"
}

variable "resource_suffix" {
  type    = string
  default = "001"
}

variable "name" {
  type = string
}

variable "environment" {
  type = string
}

variable "location" {
  type = string
}
variable "resource_group_name" {
  type = string
}

variable "sku" {
  type    = string
  default = ""
}

variable "data_retention_days" {
  type    = number
  default = 90
}

variable "tags" {
  type    = map(any)
  default = {}
}

variable "solutions" {
  type = map(object({
    publisher = string
    product   = string
  }))
  default = {}
}

variable "windows_performance_counters" {
  type = map(object({
    object_name      = string
    instance_name    = string
    counter_name     = string
    interval_seconds = number
  }))
  description = "Optional. Map of Windows performance counters to collect from Virtual Machines"
  default     = {}
}

variable "windows_event_logs" {
  type = map(object({
    event_log_name = string
    event_types    = list(string)
  }))
  description = "Optional. Map of Windows event logs to collect from Virtual Machines"
  default     = {}
}

variable "azure_ad_data_connector_enabled" {
  type        = bool
  default     = false
  description = "Optional. Enable the Azure AD Sentinel data connector"
}

variable "azure_advanced_threat_protection_data_connector_enabled" {
  type        = bool
  default     = false
  description = "Optional. Enable the Azure Advanced Threat Protection Sentinel data connector"
}

variable "azure_security_center_data_connector_enabled" {
  type        = bool
  default     = false
  description = "Optional. Enable the Azure Security Center (Defender for Cloud) Sentinel data connector"
}

variable "cloud_app_security_data_connector_enabled" {
  type        = bool
  default     = false
  description = "Optional. Enable the Microsoft Cloud App Security (Defender for Cloud Apps) Sentinel data connector"
}

variable "defender_advanced_threat_protection_data_connector_enabled" {
  type        = bool
  default     = false
  description = "Optional. Enable the Microsoft Defender ATP Sentinel data connector"
}

variable "office_365_data_connector_enabled" {
  type        = bool
  default     = false
  description = "Optional. Enable the Office 365 Sentinel data connector"
}

variable "office_365_defender_data_connector_enabled" {
  type        = bool
  default     = false
  description = "Optional. Enable the Microsoft Defender for Office 365 (Preview) Sentinel data connector"
}

variable "sentinel_aws_s3_settings_digital_cloudtrail_enabled" {
  type        = bool
  default     = false
  description = "Optional. Enable the Digital Organisation Sentinel data connector for CloudTrail"
}
variable "sentinel_aws_s3_settings_digital_guardduty_enabled" {
  type        = bool
  default     = false
  description = "Optional. Enable the Digital Organisation Sentinel data connector for CloudTrail"
}
variable "sentinel_aws_s3_settings_digital_vpcflow_enabled" {
  type        = bool
  default     = false
  description = "Optional. Enable the Digital Organisation Sentinel data connector for CloudTrail"
}

variable "sentinel_aws_s3_settings_SAP_cloudtrail_enabled" {
  type        = bool
  default     = false
  description = "Optional. Enable the Digital Organisation Sentinel data connector for CloudTrail"
}
variable "sentinel_aws_s3_settings_SAP_guardduty_enabled" {
  type        = bool
  default     = false
  description = "Optional. Enable the Digital Organisation Sentinel data connector for CloudTrail"
}
variable "sentinel_aws_s3_settings_SAP_vpcflow_enabled" {
  type        = bool
  default     = false
  description = "Optional. Enable the Digital Organisation Sentinel data connector for CloudTrail"
}
variable "sentinel_aws_s3_settings_ier_cloudtrail_enabled" {
  type        = bool
  default     = false
  description = "Optional. Enable the Digital Organisation Sentinel data connector for CloudTrail"
}

variable "sentinel_aws_s3_settings_digital_cloudtrail" {
  type = object({
    aws_role_arn      = string
    destination_table = string
    sqs_urls          = list(string)
  })
  description = "Connection configuration information for AWS S3 connection to Digital Org CloudTrail"
  default = {
    aws_role_arn      = ""
    destination_table = ""
    sqs_urls          = [""]
  }
}

variable "sentinel_aws_s3_settings_digital_guardduty" {
  type = object({
    aws_role_arn      = string
    destination_table = string
    sqs_urls          = list(string)
  })
  description = "Connection configuration information for AWS S3 connection to Digital Org GuardDuty"
  default = {
    aws_role_arn      = ""
    destination_table = ""
    sqs_urls          = [""]
  }
}

variable "sentinel_aws_s3_settings_digital_vpcflow" {
  type = object({
    aws_role_arn      = string
    destination_table = string
    sqs_urls          = list(string)
  })
  description = "Connection configuration information for AWS S3 connection to Digital Org VPC Flow logs"
  default = {
    aws_role_arn      = ""
    destination_table = ""
    sqs_urls          = [""]
  }
}


variable "sentinel_aws_s3_settings_SAP_cloudtrail" {
  type = object({
    aws_role_arn      = string
    destination_table = string
    sqs_urls          = list(string)
  })
  description = "Connection configuration information for AWS S3 connection to SAP Org CloudTrail"
  default = {
    aws_role_arn      = ""
    destination_table = ""
    sqs_urls          = [""]
  }
}

variable "sentinel_aws_s3_settings_SAP_guardduty" {
  type = object({
    aws_role_arn      = string
    destination_table = string
    sqs_urls          = list(string)
  })
  description = "Connection configuration information for AWS S3 connection to SAP Org GuardDuty"
  default = {
    aws_role_arn      = ""
    destination_table = ""
    sqs_urls          = [""]
  }
}

variable "sentinel_aws_s3_settings_SAP_vpcflow" {
  type = object({
    aws_role_arn      = string
    destination_table = string
    sqs_urls          = list(string)
  })
  description = "Connection configuration information for AWS S3 connection to SAP Org VPC Flow logs"
  default = {
    aws_role_arn      = ""
    destination_table = ""
    sqs_urls          = [""]
  }
}

variable "sentinel_aws_s3_settings_ier_cloudtrail" {
  type = object({
    aws_role_arn      = string
    destination_table = string
    sqs_urls          = list(string)
  })
  description = "Connection configuration information for AWS S3 connection to Digital Org IER CloudTrail"
  default = {
    aws_role_arn      = ""
    destination_table = ""
    sqs_urls          = [""]
  }
}

variable "sentinel_data_connector_microsoft_threat_protection_enabled" {
  type        = bool
  default     = false
  description = "Optional. Enable a Microsoft Threat Protection Data Connector. In reality this means connect the Incidents from Defender into Sentinel"
}

variable "workspace_lock_level" {
  type        = string
  default     = ""
  description = "Optional. Enable a resource Lock on the LA workspace. Options are: CanNotDelete or ReadOnly"
}
