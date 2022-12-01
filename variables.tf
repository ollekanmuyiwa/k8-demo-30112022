
#variable "resource_group_source" {
#  type        = string
#  description = "Resource group name in Azure"
#}

variable "location" {
  type        = string
  description = "Resources location in Azure"
}

variable "base_name" {
  type        = string
  description = "Base name to categorise the infrastruction group from root"
}

variable "environment" {
  type        = string
  description = "Resource subcription or enviroment in Azure from root"
}

variable "cluster_name" {
  type        = string
  description = "AKS cluster name in Azure"
}

variable "k8s_version" {
  type        = string
  description = "Desired Kubernetes version"
}

variable "node_count" {
  type        = number
  description = "Number of AKS worker nodes"
}

