# Data for Resources
data "vsphere_datacenter" "dc" {
  name = "${var.vcenter_datacenter}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.vcenter_datastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "${var.vcenter_cluster}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "${var.vcenter_resource_pool}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "${var.vcenter_network}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "template" {
  name          = "${var.vcenter_virtual_machine_template}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}


