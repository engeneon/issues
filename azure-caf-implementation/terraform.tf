# Configure the minimum required providers supported by this module

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.23.0"
      configuration_aliases = [
        azurerm.connectivity,
        azurerm.management,
      ]
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.8.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.4.0"
    }
  }

  required_version = ">= 0.15.1"

  backend "azurerm" {
    resource_group_name  = "l1-ea-rg-hkjc-000"
    storage_account_name = "l1easthkjc000"
    container_name       = "l1-ea-stct-hkjc-000"
    key                  = "azure-caf-l1-ea-rg-hkjc-000.tfstate"
  }

}

provider "azurerm" {
  features {}
}

//The below provider blocks are required for every participating subscription
provider "azurerm" {
  alias           = "connectivity"
  subscription_id = "xxxxx-4192-436a-8068-d294f693d8d3"
  features {}
}

# Declare a standard provider block using your preferred configuration.
# This will be used for the deployment of all "Management resources" to the specified `subscription_id`.

provider "azurerm" {
  alias           = "management"
  subscription_id = "yyyyyy-31a8-4859-832f-894fb9ab7831"
  features {}
}
