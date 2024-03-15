# terraform-azurerm-log-analytics-workspace

## Description

Terraform module to deploy a Log Analytics Workspace resource

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.67.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.41.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_log_analytics_datasource_windows_event.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_datasource_windows_event) | resource |
| [azurerm_log_analytics_datasource_windows_performance_counter.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_datasource_windows_performance_counter) | resource |
| [azurerm_log_analytics_solution.solution](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_solution) | resource |
| [azurerm_log_analytics_workspace.workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |
| [azurerm_sentinel_data_connector_aws_s3.AWS-S3-Digital-CloudTrail](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_aws_s3) | resource |
| [azurerm_sentinel_data_connector_aws_s3.AWS-S3-Digital-GuardDuty](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_aws_s3) | resource |
| [azurerm_sentinel_data_connector_aws_s3.AWS-S3-Digital-VPCFlow](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_aws_s3) | resource |
| [azurerm_sentinel_data_connector_aws_s3.AWS-S3-SAP-CloudTrail](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_aws_s3) | resource |
| [azurerm_sentinel_data_connector_aws_s3.AWS-S3-SAP-GuardDuty](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_aws_s3) | resource |
| [azurerm_sentinel_data_connector_aws_s3.AWS-S3-SAP-VPCFlow](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_aws_s3) | resource |
| [azurerm_sentinel_data_connector_aws_s3.AWS-S3-IER-CloudTrail](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_aws_s3) | resource |
| [azurerm_sentinel_data_connector_azure_active_directory.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_azure_active_directory) | resource |
| [azurerm_sentinel_data_connector_azure_advanced_threat_protection.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_azure_advanced_threat_protection) | resource |
| [azurerm_sentinel_data_connector_azure_security_center.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_azure_security_center) | resource |
| [azurerm_sentinel_data_connector_microsoft_cloud_app_security.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_microsoft_cloud_app_security) | resource |
| [azurerm_sentinel_data_connector_microsoft_defender_advanced_threat_protection.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_microsoft_defender_advanced_threat_protection) | resource |
| [azurerm_sentinel_data_connector_office_365.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_office_365) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_ad_data_connector_enabled"></a> [azure\_ad\_data\_connector\_enabled](#input\_azure\_ad\_data\_connector\_enabled) | Optional. Enable the Azure AD Sentinel data connector | `bool` | `false` | no |
| <a name="input_azure_advanced_threat_protection_data_connector_enabled"></a> [azure\_advanced\_threat\_protection\_data\_connector\_enabled](#input\_azure\_advanced\_threat\_protection\_data\_connector\_enabled) | Optional. Enable the Azure Advanced Threat Protection Sentinel data connector | `bool` | `false` | no |
| <a name="input_azure_security_center_data_connector_enabled"></a> [azure\_security\_center\_data\_connector\_enabled](#input\_azure\_security\_center\_data\_connector\_enabled) | Optional. Enable the Azure Security Center (Defender for Cloud) Sentinel data connector | `bool` | `false` | no |
| <a name="input_cloud_app_security_data_connector_enabled"></a> [cloud\_app\_security\_data\_connector\_enabled](#input\_cloud\_app\_security\_data\_connector\_enabled) | Optional. Enable the Microsoft Cloud App Security (Defender for Cloud Apps) Sentinel data connector | `bool` | `false` | no |
| <a name="input_data_connector_prefix"></a> [data\_connector\_prefix](#input\_data\_connector\_prefix) | n/a | `string` | `"asdc"` | no |
| <a name="input_data_retention_days"></a> [data\_retention\_days](#input\_data\_retention\_days) | n/a | `number` | `90` | no |
| <a name="input_defender_advanced_threat_protection_data_connector_enabled"></a> [defender\_advanced\_threat\_protection\_data\_connector\_enabled](#input\_defender\_advanced\_threat\_protection\_data\_connector\_enabled) | Optional. Enable the Microsoft Defender ATP Sentinel data connector | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_office_365_data_connector_enabled"></a> [office\_365\_data\_connector\_enabled](#input\_office\_365\_data\_connector\_enabled) | Optional. Enable the Office 365 Sentinel data connector | `bool` | `false` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_resource_prefix"></a> [resource\_prefix](#input\_resource\_prefix) | n/a | `string` | `"law"` | no |
| <a name="input_resource_suffix"></a> [resource\_suffix](#input\_resource\_suffix) | n/a | `string` | `"001"` | no |
| <a name="input_sentinel_aws_s3_settings_SAP_cloudtrail"></a> [sentinel\_aws\_s3\_settings\_SAP\_cloudtrail](#input\_sentinel\_aws\_s3\_settings\_SAP\_cloudtrail) | Connection configuration information for AWS S3 connection to SAP Org CloudTrail | <pre>object({<br>    aws_role_arn      = string<br>    destination_table = string<br>    sqs_urls          = list(string)<br>  })</pre> | <pre>{<br>  "aws_role_arn": "",<br>  "destination_table": "",<br>  "sqs_urls": [<br>    ""<br>  ]<br>}</pre> | no |
| <a name="input_sentinel_aws_s3_settings_SAP_cloudtrail_enabled"></a> [sentinel\_aws\_s3\_settings\_SAP\_cloudtrail\_enabled](#input\_sentinel\_aws\_s3\_settings\_SAP\_cloudtrail\_enabled) | Optional. Enable the Digital Organisation Sentinel data connector for CloudTrail | `bool` | `false` | no |
| <a name="input_sentinel_aws_s3_settings_SAP_guardduty"></a> [sentinel\_aws\_s3\_settings\_SAP\_guardduty](#input\_sentinel\_aws\_s3\_settings\_SAP\_guardduty) | Connection configuration information for AWS S3 connection to SAP Org GuardDuty | <pre>object({<br>    aws_role_arn      = string<br>    destination_table = string<br>    sqs_urls          = list(string)<br>  })</pre> | <pre>{<br>  "aws_role_arn": "",<br>  "destination_table": "",<br>  "sqs_urls": [<br>    ""<br>  ]<br>}</pre> | no |
| <a name="input_sentinel_aws_s3_settings_SAP_guardduty_enabled"></a> [sentinel\_aws\_s3\_settings\_SAP\_guardduty\_enabled](#input\_sentinel\_aws\_s3\_settings\_SAP\_guardduty\_enabled) | Optional. Enable the Digital Organisation Sentinel data connector for CloudTrail | `bool` | `false` | no |
| <a name="input_sentinel_aws_s3_settings_SAP_vpcflow"></a> [sentinel\_aws\_s3\_settings\_SAP\_vpcflow](#input\_sentinel\_aws\_s3\_settings\_SAP\_vpcflow) | Connection configuration information for AWS S3 connection to SAP Org VPC Flow logs | <pre>object({<br>    aws_role_arn      = string<br>    destination_table = string<br>    sqs_urls          = list(string)<br>  })</pre> | <pre>{<br>  "aws_role_arn": "",<br>  "destination_table": "",<br>  "sqs_urls": [<br>    ""<br>  ]<br>}</pre> | no |
| <a name="input_sentinel_aws_s3_settings_SAP_vpcflow_enabled"></a> [sentinel\_aws\_s3\_settings\_SAP\_vpcflow\_enabled](#input\_sentinel\_aws\_s3\_settings\_SAP\_vpcflow\_enabled) | Optional. Enable the Digital Organisation Sentinel data connector for CloudTrail | `bool` | `false` | no |
| <a name="input_sentinel_aws_s3_settings_digital_cloudtrail"></a> [sentinel\_aws\_s3\_settings\_digital\_cloudtrail](#input\_sentinel\_aws\_s3\_settings\_digital\_cloudtrail) | Connection configuration information for AWS S3 connection to Digital Org CloudTrail | <pre>object({<br>    aws_role_arn      = string<br>    destination_table = string<br>    sqs_urls          = list(string)<br>  })</pre> | <pre>{<br>  "aws_role_arn": "",<br>  "destination_table": "",<br>  "sqs_urls": [<br>    ""<br>  ]<br>}</pre> | no |
| <a name="input_sentinel_aws_s3_settings_digital_cloudtrail_enabled"></a> [sentinel\_aws\_s3\_settings\_digital\_cloudtrail\_enabled](#input\_sentinel\_aws\_s3\_settings\_digital\_cloudtrail\_enabled) | Optional. Enable the Digital Organisation Sentinel data connector for CloudTrail | `bool` | `false` | no |
| <a name="input_sentinel_aws_s3_settings_digital_guardduty"></a> [sentinel\_aws\_s3\_settings\_digital\_guardduty](#input\_sentinel\_aws\_s3\_settings\_digital\_guardduty) | Connection configuration information for AWS S3 connection to Digital Org GuardDuty | <pre>object({<br>    aws_role_arn      = string<br>    destination_table = string<br>    sqs_urls          = list(string)<br>  })</pre> | <pre>{<br>  "aws_role_arn": "",<br>  "destination_table": "",<br>  "sqs_urls": [<br>    ""<br>  ]<br>}</pre> | no |
| <a name="input_sentinel_aws_s3_settings_digital_guardduty_enabled"></a> [sentinel\_aws\_s3\_settings\_digital\_guardduty\_enabled](#input\_sentinel\_aws\_s3\_settings\_digital\_guardduty\_enabled) | Optional. Enable the Digital Organisation Sentinel data connector for CloudTrail | `bool` | `false` | no |
| <a name="input_sentinel_aws_s3_settings_digital_vpcflow"></a> [sentinel\_aws\_s3\_settings\_digital\_vpcflow](#input\_sentinel\_aws\_s3\_settings\_digital\_vpcflow) | Connection configuration information for AWS S3 connection to Digital Org VPC Flow logs | <pre>object({<br>    aws_role_arn      = string<br>    destination_table = string<br>    sqs_urls          = list(string)<br>  })</pre> | <pre>{<br>  "aws_role_arn": "",<br>  "destination_table": "",<br>  "sqs_urls": [<br>    ""<br>  ]<br>}</pre> | no |
| <a name="input_sentinel_aws_s3_settings_digital_vpcflow_enabled"></a> [sentinel\_aws\_s3\_settings\_digital\_vpcflow\_enabled](#input\_sentinel\_aws\_s3\_settings\_digital\_vpcflow\_enabled) | Optional. Enable the Digital Organisation Sentinel data connector for CloudTrail | `bool` | `false` | no |
| <a name="input_sentinel_aws_s3_settings_ier_cloudtrail"></a> [sentinel\_aws\_s3\_settings\_ier\_cloudtrail](#input\_sentinel\_aws\_s3\_settings\_digital\_cloudtrail) | Connection configuration information for AWS S3 connection to Digital Org Queue for IER Application environment for CloudTrail log data | <pre>object({<br>    aws_role_arn      = string<br>    destination_table = string<br>    sqs_urls          = list(string)<br>  })</pre> | <pre>{<br>  "aws_role_arn": "",<br>  "destination_table": "",<br>  "sqs_urls": [<br>    ""<br>  ]<br>}</pre> | no |
| <a name="input_sentinel_aws_s3_settings_ier_cloudtrail_enabled"></a> [sentinel\_aws\_s3\_settings\_ier\_cloudtrail\_enabled](#input\_sentinel\_aws\_s3\_settings\_ier\_cloudtrail\_enabled) | Optional. Enable the Digital Organisation Sentinel data connector for IER CloudTrail logs | `bool` | `false` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | n/a | `string` | `""` | no |
| <a name="input_solutions"></a> [solutions](#input\_solutions) | n/a | <pre>map(object({<br>    publisher = string<br>    product   = string<br>  }))</pre> | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | `{}` | no |
| <a name="input_windows_event_logs"></a> [windows\_event\_logs](#input\_windows\_event\_logs) | Optional. Map of Windows event logs to collect from Virtual Machines | <pre>map(object({<br>    event_log_name = string<br>    event_types    = list(string)<br>  }))</pre> | `{}` | no |
| <a name="input_windows_performance_counters"></a> [windows\_performance\_counters](#input\_windows\_performance\_counters) | Optional. Map of Windows performance counters to collect from Virtual Machines | <pre>map(object({<br>    object_name      = string<br>    instance_name    = string<br>    counter_name     = string<br>    interval_seconds = number<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_location"></a> [location](#output\_location) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | n/a |
| <a name="output_workspace_id"></a> [workspace\_id](#output\_workspace\_id) | n/a |
| <a name="output_workspace_primary_shared_key"></a> [workspace\_primary\_shared\_key](#output\_workspace\_primary\_shared\_key) | n/a |
| <a name="output_workspace_secondary_shared_key"></a> [workspace\_secondary\_shared\_key](#output\_workspace\_secondary\_shared\_key) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Usage