
output "rg_01_name_out" {
  value = module.ResourceGroup.rg_01_name_out
}
output "rg_02_name_out" {
  value = module.ResourceGroup.rg_02_name_out
}

output "stg_name_out" {
  value = module.StorageAccount.stg_name_out
}

output "stg_container_name_out" {
  value = module.StorageAccount.stg_conta_name_out
}

output "acrID" {
  value = module.ContainerRegistry.acr_id
}

output "acrloginServer" {
  value = module.ContainerRegistry.acr_login_server
}

output "objectID" {
  value = module.KubernetesService.object_id
}

output "aksID" {
  value = module.KubernetesService.aks01_id
}

output "aks01FQDN" {
  value = module.KubernetesService.aks01_fqdn
}

output "aksnoderg" {
  value = module.KubernetesService.aks_node_rg
}

#======================
output "aksname" {
  value = module.KubernetesService.aks_name
}
#======================