
module "ResourceGroup" {
  source    = ".\\shared\\ResourceGroup"
  base_name = var.base_name
  location  = var.location
  env       = var.environment
}

module "StorageAccount" {
  source              = ".\\shared\\StorageAccount"
  base_name           = var.base_name
  resource_group_name = module.ResourceGroup.rg_01_name_out
  location            = var.location
  env                 = var.environment
}

module "ContainerRegistry" {
  source              = ".\\shared\\ContainerRegistry"
  resource_group_name = module.ResourceGroup.rg_01_name_out
  location            = var.location
  #location1           = "UK West"
  #location2           = "West Europe"
}

module "RoleAssignment" {
  source            = ".\\shared\\RoleAssignment"
  acr_scope         = module.ContainerRegistry.acr_id
  role_principal_id = module.KubernetesService.object_id
}

module "KubernetesService" {
  source              = ".\\modules\\KubernetesService"
  resource_group_name = module.ResourceGroup.rg_02_name_out
  location            = var.location
  clusterName         = var.cluster_name
  kubernetes_version  = var.k8s_version
  node_count          = var.node_count
  base_name           = var.base_name
  env                 = var.environment
}

module "KubernetesSecret" {
  source = ".\\modules\\KubernetesSecret"
}

module "IngressController" {
  source = ".\\modules\\IngressController"
}

module "CertificateManager" {
  source = ".\\modules\\CertificateManager"
}
