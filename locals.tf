locals {
  resource_name = "${var.resource_prefix}-${var.environment}-${var.name}-${var.resource_suffix}"
  min_tags = {
    "businessUnit"       = ""
    "costCentre"         = ""
    "createdDateTime"    = ""
    "dataClassification" = ""
    "environment"        = var.environment
    "opsTeam"            = ""
    "owner"              = ""
    "workloadName"       = ""
  }

  combined_tags = merge(local.min_tags, var.tags)
}
