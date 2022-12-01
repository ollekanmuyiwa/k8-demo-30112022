
output "acr_id" {
  value = azurerm_container_registry.acr_01.id
}

output "acr_login_server" {
  value = azurerm_container_registry.acr_01.login_server
}
