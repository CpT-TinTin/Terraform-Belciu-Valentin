output "pass1" {
  value =  random_password.pass.0.result
  sensitive = true
}
output "pass2" {
  value =  random_password.pass.1.result
  sensitive = true
}
output "pass3" {
  value =  random_password.pass.2.result
  sensitive = true
}
output "vm1_ip" {
  value = azurerm_public_ip.publicip[0].ip_address
}
output "vm2_ip" {
  value = azurerm_public_ip.publicip[1].ip_address
}
output "vm3_ip" {
  value = azurerm_public_ip.publicip[2].ip_address
}
