
resource "azurerm_kubernetes_cluster" "aks_01" {
  name                = "${lower(var.env)}-${lower(var.base_name)}-01"
  kubernetes_version  = var.kubernetes_version
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.clusterName

  default_node_pool {
    name       = "system"
    node_count = var.node_count
    vm_size    = "Standard_DS2_v2"
    type       = "VirtualMachineScaleSets"
    #availability_zones  = [1, 2, 3]
    enable_auto_scaling = true
    max_count           = 5
    min_count           = 3
  }

  identity {
    type = "SystemAssigned"
  }
  /*
  network_profile {
    load_balancer_sku = "Standard"
    network_plugin    = "kubenet"
  }
*/
}
