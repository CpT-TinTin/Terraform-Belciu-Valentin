resource "null_resource" "vm1_to_vm2_ping" {
  count = 2
   depends_on = [azurerm_public_ip.publicip]
  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "azureuser"
      password = random_password.pass[count.index].result
      host = azurerm_public_ip.publicip[count.index].ip_address
    }
    inline = [  "ping -c 4 ${azurerm_public_ip.publicip[(count.index + 1) % length(azurerm_public_ip.publicip)].ip_address}"]
  }
}

