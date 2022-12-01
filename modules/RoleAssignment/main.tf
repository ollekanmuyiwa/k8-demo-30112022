
resource "azurerm_role_assignment" "acrrole" {
  scope                            = var.acr_scope
  role_definition_name             = "AcrPull"
  principal_id                     = var.role_principal_id
  skip_service_principal_aad_check = true
}

