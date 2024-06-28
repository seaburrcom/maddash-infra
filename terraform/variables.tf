variable "dc_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}

variable "resource_group_desired_name" {
    type        = string
    default     = "seaburrcom-lab-rg"
    description = "Resource group name."
}