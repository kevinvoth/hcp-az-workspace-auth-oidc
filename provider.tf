terraform {
  # https://developer.hashicorp.com/terraform/install
  required_version = ">= 1.17.0"

  required_providers {
    azurerm = {
      # https://registry.terraform.io/providers/hashicorp/azurerm/latest
      source  = "hashicorp/azurerm"
      version = "5.14.0"
    }
  }

  cloud {
    organization = "vothdev"

    workspaces {
      name = "hcp-az-workspace-auth-oidc"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "1b7ba0c4-0c98-4572-947e-0759a7cd2216"
}
