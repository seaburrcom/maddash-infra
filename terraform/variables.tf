variable "dc_location" {
  type        = string
  default     = "eastus2"
  description = "Location of the resource group."
}

variable "resource_group_desired_name" {
    type        = string
    default     = "seaburrcom-lab-rg"
    description = "Resource group name."
}

variable "acr_name" {
    type = string
    default = "seaburrcom"
    description = "ACR registry name."
}

variable "acr_service_tier" {
    type = string
    default = "Basic"
    description = "Registry service tier for ACR."
}

variable "node_count" {
  type        = number
  description = "The initial quantity of nodes for the node pool."
  default     = 1
}

variable "node_type" {
    type = string
    description = "VM type for node pool. Minimum specs 2vcpu/4gb mem. Default here is the most economical found (~25/mo).
    default = "Standard_B2pls_v2"
}

variable "msi_id" {
  type        = string
  description = "The Managed Service Identity ID. Set this value if you're running this example using Managed Identity as the authentication method."
  default     = null
}

variable "username" {
  type        = string
  description = "The admin username for the new cluster."
  default     = "azureadmin"
}