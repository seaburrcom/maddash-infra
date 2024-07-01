resource "azurerm_resource_group" "rg" {
  location = var.dc_location
  name     = var.resource_group_desired_name
}

resource "azurerm_virtual_network" "seaburrcom_vnet" {
  name                = "seaburrcom_vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.dc_location
  resource_group_name = var.resource_group_desired_name
}

resource "azurerm_subnet" "vnet_subnet_1" {
  name                 = "subnet-1"
  resource_group_name  = var.resource_group_desired_name
  virtual_network_name = "seaburrcom_vnet"
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_desired_name
  location            = var.dc_location
  sku                 = var.acr_service_tier
  admin_enabled       = false
}

resource "random_pet" "azurerm_kubernetes_cluster_name" {
  prefix = "cluster"
}

resource "random_pet" "azurerm_kubernetes_cluster_dns_prefix" {
  prefix = "dns"
}

resource "azurerm_kubernetes_cluster" "k8s" {
  location            = var.dc_location
  name                = random_pet.azurerm_kubernetes_cluster_name.id
  resource_group_name = var.resource_group_desired_name
  dns_prefix          = random_pet.azurerm_kubernetes_cluster_dns_prefix.id

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name       = "agentpool"
    vm_size    = "Standard_B2pls_v2"
    node_count = var.node_count
  }
  linux_profile {
    admin_username = var.username

    ssh_key {
      key_data = azapi_resource_action.ssh_public_key_gen.output.publicKey
    }
  }
  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }
}