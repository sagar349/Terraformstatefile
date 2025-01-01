output "public_ip_address" {
  value = azurerm_public_ip.main.ip_address
  description = "The public IP address of the VM"
}

output "vm_name" {
  value = azurerm_virtual_machine.main.name
  description = "The name of the VM"
}
