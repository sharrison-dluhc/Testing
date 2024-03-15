output "id" {
  value = azurerm_log_analytics_workspace.workspace.id

}

output "location" {
  value = azurerm_log_analytics_workspace.workspace.location

}

output "name" {
  value = azurerm_log_analytics_workspace.workspace.name

}

output "resource_group_name" {
  value = azurerm_log_analytics_workspace.workspace.resource_group_name

}

output "workspace_id" {
  value = azurerm_log_analytics_workspace.workspace.workspace_id
}

output "workspace_primary_shared_key" {
  value     = azurerm_log_analytics_workspace.workspace.primary_shared_key
  sensitive = true
}

output "workspace_secondary_shared_key" {
  value     = azurerm_log_analytics_workspace.workspace.secondary_shared_key
  sensitive = true
}
