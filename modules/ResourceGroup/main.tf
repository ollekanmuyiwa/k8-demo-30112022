
# Resource group for ACR ang TFSTATE storage account
resource "azurerm_resource_group" "rg_01" {
  name     = "${lower(var.env)}-shared-rg"
  location = var.location
}

#Resource Groug for kubernetes cluster
resource "azurerm_resource_group" "rg_02" {
  name     = "${lower(var.env)}-${lower(var.base_name)}-rg"
  location = var.location
}

