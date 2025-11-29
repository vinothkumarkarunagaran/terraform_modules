output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.server.id
}

output "public_ip" {
  description = "Public IP address (if assigned)"
  value       = aws_instance.server.public_ip
}

output "public_dns" {
  description = "Public DNS name (if assigned)"
  value       = aws_instance.server.public_dns
}

output "private_ip" {
  description = "Private IP address"
  value       = aws_instance.server.private_ip
}

output "security_group_ids" {
  description = "Security group IDs attached to the instance"
  value       = aws_instance.server.vpc_security_group_ids
}
