terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.86"
    }
  }

  required_version = ">= 1.0.11"
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "silvio-1" {
  name     = "Silvio001"
  location = "germanywestcentral"
  tags = {
    "author" = "kevinsandermann"
  }
}

resource "azurerm_resource_group" "silvio-2" {
  name     = "Silvio002"
  location = "germanywestcentral"
  tags = {
    "author" = "kevinsandermann"
  }
}

resource "azurerm_kubernetes_cluster" "kubernetes" {
  name                = "kubernetes-1"
  location            = azurerm_resource_group.silvio-1.location
  resource_group_name = azurerm_resource_group.silvio-1.name
  dns_prefix          = "kubernetes"

  network_profile {
    network_plugin = "kubenet"
    dns_service_ip = "10.0.0.10"
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