output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.this.id
}

output "public_ip" {
  description = "Public IP address (if assigned)"
  value       = aws_instance.this.public_ip
}

output "public_dns" {
  description = "Public DNS name (if assigned)"
  value       = aws_instance.this.public_dns
}

output "private_ip" {
  description = "Private IP address"
  value       = aws_instance.this.private_ip
}

output "security_group_ids" {
  description = "Security group IDs attached to the instance"
  value       = aws_instance.this.vpc_security_group_ids
}
