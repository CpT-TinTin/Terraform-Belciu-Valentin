variable "null_resource_names" {
  description = "Set of null resource names"
  type = set(string)
  default = [ "vm1_vm2_ping0", "vm1_vm2_ping2" ]  
}
resource "null_resource" "vm1_to_vm2_ping" {
  
  for_each =   var.null_resource_names
  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "azureuser"
      password = random_password.pass[each.key].result
       host     = each.key == "vm1_to_vm2_ping0" ? azurerm_public_ip.publicip["publicip0"].ip_address : azurerm_public_ip.publicip["publicip1"].ip_address
    }

     inline = [
      "ping -c 4 ${each.key == "vm1_to_vm2_ping0" ? azurerm_public_ip.publicip["publicip1"].ip_address : azurerm_public_ip.publicip["publicip0"].ip_address}"
    ]
}
}

