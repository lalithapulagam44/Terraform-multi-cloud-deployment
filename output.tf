output "aws_instance_public_ip" {
  value = aws_instance.example.public_ip
  description = "Public IP address of the AWS EC2 instance."
}

output "aws_instance_private_ip"{
    value = aws_instance.example.private_ip
    description = "Private IP address of the AWS EC2 instance."
}

output "azure_public_ip_address" {
    value = azurerm_public_ip.example.ip_address
    description = "Public IP address of the Azure virtual machines."
}

output "azure_private_ip_address" {
    value = azurerm_network_interface.example.private_ip_addresses
    description = "Private IP address of the Azure virtual machine"
}


output "gcp_instance_public_ip" {
    value = google_compute_instance.example.network_interface.0.access_config.0.nat_ip
    description = "Public IP address of the GCP Compute Engine instance."
}

output "gcp_instance_private_ip" {
    value = google_compute_instance.example.network_interface.0.network_ip
    description = "Private IP address of the GCP Compute Engine instance."
}

