terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.61.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "1e3a2a89-cbb0-4fb7-9e68-6108392090e8"
}
