source "azure-arm" "control-vm" {
  azure_tags = {
    dept = "dev"
    task = "control-vm"
  }
  client_id                         = "${var.client_id}"
  client_secret                     = "${var.client_secret}"
  image_offer                       = "UbuntuServer"
  image_publisher                   = "Canonical"
  image_sku                         = "18.04-LTS"
  location                          = "East US"
  managed_image_name                = "lin-test1"
  managed_image_resource_group_name = "packer-rg"
  os_type                           = "Linux"
  subscription_id                   = "${var.subscription_id}"
  tenant_id                         = "${var.tenant_id}"
  vm_size                           = "Standard_DS2_v2"
}

build {
  sources = ["source.azure-arm.control-vm"]

  provisioner "shell" {

    
    ## script to run on the VM dontrol-vm/scripts/dev-0.sh
    script = "./dev-o.sh"

  }

  

}
