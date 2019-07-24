# vsphere6.5_terraform

This will allow you to provision VMs on Vsphere 6.5 using terraform

## Getting Started

To get started, please make sure you have hachicorp terraform installed on your system. If you don't get it here: https://www.terraform.io/downloads.html and add it to your PATH

Download this repository

### Prerequisites

PC/Laptop
Linux/MAC/WIN
terraform
vsphere esxi access
know your datacenter, datastore, network and other pre-requisites to configure terraform.tfvars file

### Set up your variables

Open terraform.tfvars file with editor of your choice

You then should see something similar to this
```
# Credentials to login to vcenter
user = "THISISYOURFULLEMAILADDRESS"
password = "THISISYOURPASSWORD"

# Don't change this
vcenter_server = "VCENTERURL"
vcenter_domain = "YOURDOMAIN"

# Change this only if you know what you doing
vcenter_datacenter = "DATACENTERNAME"
vcenter_datastore = "DATASTORENAME"
vcenter_cluster = "CLUSTERNAME"
vcenter_resource_pool = "RESOURCEPOOLNAME/Resources"
vcenter_network = "PUTYOURNETWORKHERE"
vcenter_virtual_machine_template = "TEMPLATENAME"
vcenter_host_name = "VMHOSTNAME"
vcenter_network_interface_ipv4 = "VMIPV4ADDRESS"
vcenter_network_interface_ipv4_gateway = "VMIPV4GATEWAY"
vcenter_host_name_disk_name = "VMHOSTNAME.vmdk"
```
Populate this file with correct values for your vsphere environement

Sometimes it can be hard to find what names are setup in the enterprise environment, but possibly the below picture as an example can assist where to look for this info

<img src="https://pubs.vmware.com/vi35u2/resmgmt/images/vc_resource_pools.5.2.1.jpg"
     alt="VMWare"
     style="float: left; margin-right: 10px;" />

## Running the tests

Once you cloned this repository and have terraform installed and in your path run the below command to download provider plugins

```
$ terraform init
```

After it has finished you should see something as per below:

<img src="https://cdn-images-1.medium.com/max/1600/1*-oX97juJPdDMU12xVJ2BuA.png"
     alt="terraform init"
     style="float: left; margin-right: 10px;" />

### End to end tests

Now if the above has worked you can go to planning stage and execute the below command

```
$ terraform plan

```
This will now connect to your vcenter and try to plan the provisioning if all provided variables are correct and available.
Once this is planned at the top you will be able to see that it can create witrh "+create".
This is good, let's go to the next step

## Deployment

If the above worked then do this:

```
$ terraform apply
```

Once all is checked, you will be provided with the summary of what terraform is trying to do and it will ask you to confirm if you are happy to proceed - yes/no

If you choose to proceed, VM will be provisioned on vcenter, if you choose not to proceed you can cancel from here by typing n for no

## Check it worked

There are few ways:

* Login to vcenter and search for the VM
* Ping the provisioned IP address
* Login to vm - my recommended way

## Deleting created VM

In order delete the created VM, run the below:

```
$ terraform destroy
```

## Contributing

Everyone is welcome to contribute

## Versioning

I use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/victorbiga/vsphere6.5_terraform/tags). 

## Authors

* **Victor Biga** - *Initial work* - [VictorBiga](https://github.com/VictorBiga)

## License

This project is licensed under the MIT License

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc

