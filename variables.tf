variable "resource_group_name" {
  type    = string
  default = "daniel-rg"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "cluster_name" {
  type    = string
  default = "myAKSCluster"
}

variable "acr_name" {
  type    = string
  default = "myACRRegistryNDdemo"
}

variable "vnet_name" {
  type    = string
  default = "myVNet"
}

variable "subnet_name" {
  type    = string
  default = "mySubnet"
}