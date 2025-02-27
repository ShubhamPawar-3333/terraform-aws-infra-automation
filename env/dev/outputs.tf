output "bastion_public_ip" {
  description = "Public IP of the Bastion host in dev"
  value       = module.bastion.bastion_public_ip
}