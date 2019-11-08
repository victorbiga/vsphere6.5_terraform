# Setup vSphere Provider and login
provider "vsphere" {
  user           = "${var.user}"
  password       = "${var.password}"
  vsphere_server = "${var.vcenter_server}"

# If you have a self-signed cert
  allow_unverified_ssl = true
}
