terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.67.0"
    }
  }
  required_version = ">= 0.15.0"
  experiments = [
    module_variable_optional_attrs
  ]
}
