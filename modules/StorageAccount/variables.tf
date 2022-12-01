
variable "base_name" {
  type        = string
  description = "Base name to categorise the infrastruction group"
}

variable "env" {
  type        = string
  description = "Resource subcription or enviroment in Azure"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name in Azure"
}

variable "location" {
  type        = string
  description = "Resources location in Azure"
}
