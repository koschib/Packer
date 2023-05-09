source "azure-arm" "control-vm" {
  azure_tags = {
    dept = "dev"
    task = "control-vm"
  }

  image_offer                       = "UbuntuServer"
  image_publisher                   = "Canonical"
  image_sku                         = "18.04-LTS"
  location                          = "East US"
  managed_image_name                = "linux1"
  managed_image_resource_group_name = "packer-rg"
  os_type                           = "Linux"
  vm_size                           = "Standard_DS2_v2"
  use_azure_cli_auth                = true
}



build {
  sources = ["source.azure-arm.control-vm"]

  provisioner "shell" {



    script = "./dev-o.sh"

  }



}
