#provide the details of the current logged in subscription/account
data "azurerm_client_config" "core" {}

# Call the caf-enterprise-scale module directly from the Terraform Registry
# pinning to the latest version

module "enterprise_scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "2.3.1"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = "engeneon"
  root_name      = "Engeneon"

  default_location = "eastasia"

  deploy_management_resources = false 
  deploy_connectivity_resources = true

  subscription_id_management  = data.azurerm_client_config.core.subscription_id
  subscription_id_connectivity  = "xxxxx-4192-436a-8068-d294f693d8d3"

}
