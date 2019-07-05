# Created by Earthport Linux Team 2019 with love

# Define our variables
variable "user" {
  type = string
}

variable "password" {
  type = string
}

variable "vcenter_server" {
  type = string
}

variable "vcenter_datacenter" {
  type = string
}

variable "vcenter_datastore" {
  type = string
}

variable "vcenter_cluster" {
  type = string
}

variable "vcenter_resource_pool" {
  type = string
}

variable "vcenter_network" {
  type = string
}

variable "vcenter_virtual_machine_template" {
  type = string
}

variable "vcenter_host_name" {
  type = string
}

variable "vcenter_domain" {
  type = string
}

variable "vcenter_network_interface_ipv4" {
  type = string
}

variable "vcenter_network_interface_ipv4_gateway" {
  type = string
}

variable "vcenter_host_name_disk_name" {
    type = string
}


variable "mynewhost" {
    type = string
}