terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.81.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "newrg"
    storage_account_name = "samplesto777"
    container_name       = "container"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}