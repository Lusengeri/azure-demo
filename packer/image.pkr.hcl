variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

source "azure-arm" "ubuntu" {
  image_offer                       = "0001-com-ubuntu-server-jammy"
  image_publisher                   = "Canonical"
  image_sku                         = "22_04-lts"
  location                          = "South Africa North"
  managed_image_name                = "DemoAppImage${formatdate("YYYYMMDDhhmmss", timestamp())}"
  managed_image_resource_group_name = var.resource_group_name
  os_type                           = "Linux"

  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id

  use_azure_cli_auth = true
  vm_size            = "Standard_A2_v2"
}

build {
  sources = ["source.azure-arm.ubuntu"]

  provisioner "shell" {
    script = "./setup.sh"
  }
}