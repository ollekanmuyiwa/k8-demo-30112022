
resource "random_string" "resource_code" {
  length  = 5
  special = false
  upper   = false
}

resource "azurerm_storage_account" "stg_01" {
  name                     = "${lower(var.env)}${lower(var.base_name)}stg${random_string.resource_code.result}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container_01" {
  name                  = "${lower(var.env)}-${lower(var.base_name)}-stg01-01"
  storage_account_name  = azurerm_storage_account.stg_01.name
  container_access_type = "blob"
}

/*
resource "azurerm_storage_container" "sc_001" {
  name                  = "${lower(var.env)}-${lower(var.base_name)}-stg01-02"
  storage_account_name  = azurerm_storage_account.stg_01.name
  container_access_type = "private"
}
*/
