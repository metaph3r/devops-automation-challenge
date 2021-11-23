terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.86"
    }
  }

  backend "azurerm" {
    resource_group_name  = "Silvio001"
    storage_account_name = "devopschallenge"
    container_name       = "tfstatefile"
    key                  = "prod.terraform.tfstate"
  }

  required_version = ">= 1.0.11"
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_kubernetes_cluster" "kubernetes" {
  name                = "kubernetes-1"
  location            = "germanywestcentral"
  resource_group_name = "Silvio001"
  dns_prefix          = "kubernetes"

  network_profile {
    network_plugin = "kubenet"
  }

  addon_profile {
    http_application_routing {
      enabled = true
    }
  }

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_kubernetes_cluster" "kubernetes2" {
  name                = "kubernetes-2"
  location            = "germanywestcentral"
  resource_group_name = "Silvio002"
  dns_prefix          = "kubernetes"

  network_profile {
    network_plugin = "kubenet"
  }

  addon_profile {
    http_application_routing {
      enabled = true
    }
  }

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}
