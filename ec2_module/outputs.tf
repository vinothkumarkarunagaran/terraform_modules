output "instance_ids" {
  description = "The IDs of the EC2 instances"
  value       = aws_instance.server[*].id
}

output "public_ips" {
  description = "Public IP addresses (if assigned)"
  value       = aws_instance.server[*].public_ip
}

output "public_dns" {
  description = "Public DNS names (if assigned)"
  value       = aws_instance.server[*].public_dns
}

output "private_ips" {
  description = "Private IP addresses"
  value       = aws_instance.server[*].private_ip
}

output "security_group_ids" {
  description = "Security group IDs attached to the instances"
  value       = aws_instance.server[*].vpc_security_group_ids
}

output "instance_role_tag" {
  description = "Role tag value applied to instances"
  value       = var.tag
}
