
terraform {
    backend "azurerm" {
        resource_group_name  = "shared-shared-rg"
        storage_account_name = "sharedwebchisestgenxd4"
        container_name       = "shared-webchise-stg01-01"
        key                  = "terraform.tfstate"
    }
}