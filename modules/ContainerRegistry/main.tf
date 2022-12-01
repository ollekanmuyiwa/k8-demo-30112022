
resource "azurerm_container_registry" "acr_01" {
  name                = "azuragroup"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Premium"
  admin_enabled       = false
  /*
  georeplications {
    location                = var.location1
    zone_redundancy_enabled = true
    tags                    = {}
  }
  georeplications {
    location                = var.location2
    zone_redundancy_enabled = true
    tags                    = {}
  }
  */
}
