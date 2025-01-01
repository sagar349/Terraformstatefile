terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

locals {
  workspace_suffix = terraform.workspace == "default" ? "" : "-${terraform.workspace}"
  
  # Environment-specific configurations
  environment_configs = {
    dev = {
      location    = "eastus"
      vm_size     = "Standard_B1s"
      instance_count = 1
    }
    staging = {
      location    = "eastus2"
      vm_size     = "Standard_B2s"
      instance_count = 2
    }
    prod = {
      location    = "westus2"
      vm_size     = "Standard_D2s_v3"
      instance_count = 3
    }
  }

  # Get current workspace config, default to dev if workspace not found
  current_config = lookup(local.environment_configs, terraform.workspace, local.environment_configs.dev)
}
