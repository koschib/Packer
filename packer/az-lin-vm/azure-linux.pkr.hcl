source "azure-arm" "control-vm" {

  #client_id       = var.client_id
  #client_secret   = var.client_secret
  #subscription_id = var.subscription_id
  #tenant_id       = var.tenant_id

  azure_tags = {
    dept = "dev"
    task = "control-vm"
  }
  image_offer                       = "0001-com-ubuntu-server-jammy"
  image_publisher                   = "Canonical"
  image_sku                         = "22_04-lts-gen2"
  location                          = "westeurope"
  managed_image_name                = "dlwe-mat-im-packer-dev-01"
  managed_image_resource_group_name = "dlwe-mat-rg-packer-dev-01"
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

