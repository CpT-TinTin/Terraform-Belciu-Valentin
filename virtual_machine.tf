resource "azurerm_virtual_machine" "DockerVm" {
        name = "DockerVm"
        location = azurerm_resource_group.rg.location
        resource_group_name = azurerm_resource_group.rg.name   
        network_interface_ids = [azurerm_network_interface.nic.2.id]
        vm_size = "Standard_DS1_v2"
        delete_os_disk_on_termination = true
        delete_data_disks_on_termination = true
        storage_image_reference {
                publisher = "Canonical"
                offer = "UbuntuServer"
                sku = "18.04-LTS"
                version = "latest"
        }
        storage_os_disk {
                name = "myosdisk"
                caching = "ReadWrite"
                create_option = "FromImage"
                
        }
        os_profile {
    computer_name  = "hostname"
    admin_username = "azureuser"
    admin_password = "Azurepass1"
}

os_profile_linux_config {
    disable_password_authentication = false
}

  connection {
    type = "ssh"
    user= "azureuser"
    password = "Azurepass1"
    host = azurerm_public_ip.publicip.2.ip_address
  }
  provisioner "remote-exec" {
  
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
      "sudo add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable'",
      "sudo apt-get update",
      "sudo apt-get install -y docker-ce",
    "sudo docker login -u ${var.acr_admin_username} -p ${var.acr_admin_password} ${var.acr_login_server}",
      "sudo docker pull ${var.acr_login_server}/my-nginx-image:v1",
      "sudo docker run -d -p 80:80 ${var.acr_login_server}/my-nginx-image:v1"
    ]
  }
}
