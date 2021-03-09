
output "vm_name" {
  value       = values(azurerm_linux_virtual_machine.vm)[*].name
  description = "Virtual machine name"
}

output "vm_admin_user" {
  value       = values(azurerm_linux_virtual_machine.vm)[*].admin_username
  description = "Virtual machine admin user name"
}

output "vm_public_ip" {
  value       = values(azurerm_public_ip.vmpublicip)[*].ip_address
  description = "Virtual machine public ip address"
}

output "tls_private_key" { 
  value = tls_private_key.vmssh.private_key_pem 
  description = "Private key to login to the VM using SSH"
}

output "vm_output" {
  value = zipmap( values(azurerm_linux_virtual_machine.vm)[*].name, values(azurerm_public_ip.vmpublicip)[*].ip_address ) 
  description = "VM Name vs public ip"
}
