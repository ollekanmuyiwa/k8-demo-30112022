
output "stg_name_out" {
  value = resource.azurerm_storage_account.stg_01.name
}

output "stg_conta_name_out" {
  value = resource.azurerm_storage_container.container_01.name
}