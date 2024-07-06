resource "null_resource" "vm1_to_vm2_ping" {
   triggers = {
    ip = azurerm_public_ip.publicip[1].ip_address
  }
  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "azureuser"
      password = random_password.pass.0.result
      host = azurerm_public_ip.publicip[0].ip_address
    }
    inline = [  "ping -c 4 ${azurerm_public_ip.publicip[1].ip_address}"]
  }
}
resource "null_resource" "vm2to_vm3_ping" {
   triggers = {
    ip = azurerm_public_ip.publicip[2].ip_address
  }
  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "azureuser"
      password = random_password.pass.1.result
      host = azurerm_public_ip.publicip[1].ip_address
    }
    inline = [  "ping -c 4 ${azurerm_public_ip.publicip[2].ip_address}"]
  }
}
resource "null_resource" "vm3to_vm1_ping" {
   triggers = {
    ip = azurerm_public_ip.publicip[0].ip_address
  }
  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "azureuser"
      password = random_password.pass.2.result
      host = azurerm_public_ip.publicip[2].ip_address
    }
    inline = [  "ping -c 4 ${azurerm_public_ip.publicip[0].ip_address}"]
  }
}