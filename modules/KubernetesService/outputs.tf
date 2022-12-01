
output "object_id" {
  value = azurerm_kubernetes_cluster.aks_01.kubelet_identity.0.object_id
}

output "aks01_id" {
  value = azurerm_kubernetes_cluster.aks_01.id
}

output "aks01_fqdn" {
  value = azurerm_kubernetes_cluster.aks_01.fqdn
}

output "aks_node_rg" {
  value = azurerm_kubernetes_cluster.aks_01.node_resource_group
}

resource "local_file" "kubeconfig" {
  depends_on = [azurerm_kubernetes_cluster.aks_01]
  filename   = "kubeconfig"
  content    = azurerm_kubernetes_cluster.aks_01.kube_config_raw
}

#=======================
output "aks_name" {
  value = azurerm_kubernetes_cluster.aks_01.name
}
#=======================