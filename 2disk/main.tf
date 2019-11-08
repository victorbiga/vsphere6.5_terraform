resource "vsphere_virtual_machine" "Clone" {
  name             = "${var.vcenter_host_name}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  folder	   = "${var.vcenter_folder}"

  num_cpus = 1
  memory   = 4096
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    name             = "${var.vcenter_host_name}_1.vmdk"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  disk {
    name             = "${var.vcenter_host_name}_2.vmdk"
    size             = "${var.vm_disk_size}"
    unit_number      = 1
  }



  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"
    customize {
      linux_options {
        host_name = "${var.vcenter_host_name}"
        domain    = "${var.vcenter_domain}"
      }

      network_interface {
        ipv4_address = "${var.vcenter_network_interface_ipv4}"
        ipv4_netmask = 24
      }
    ipv4_gateway = "${var.vcenter_network_interface_ipv4_gateway}"
    dns_suffix_list = ["YOURDOMAIN.com"]
    dns_server_list = ["YOURDNSIP"]
    }
   }

  provisioner "file" {
      source        = "./create_filesystem"
      destination   = "/tmp/create_filesystem"

      connection {
        type     = "ssh"
        user     = "root"
        password = "${var.root_password}"
        host     = "${var.vcenter_host_name}"
      }
    }



    provisioner "remote-exec" {
      inline = [
        "chmod +x /tmp/create_filesystem",
        "sudo /tmp/create_filesystem"
      ]
    
      connection {
        type     = "ssh"
        user     = "root"
        password = "${var.root_password}"
        host     = "${var.vcenter_host_name}"
      }
  }
}
