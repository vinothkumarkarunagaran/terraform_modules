variable "name" {
  description = "Name used for tagging resources"
  type        = string
  default     = "ec2-instance"
}

variable "ami" {
  description = "AMI id for the instance"
  type        = string
  default     = "ami-0e7938ad51d883574"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.small"
}

variable "key_name" {
  description = "SSH key pair name (optional)"
  type        = string
  default     = "pavi"   # ✅ key name should NOT include .pem
}

variable "vpc_security_group_ids" {
  description = "List of existing security group IDs to attach"
  type        = list(string)
  default     = ["sg-010d62341933131c7"]
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address"
  type        = bool
  default     = true
}

variable "ebs_volumes" {
  description = "List of additional EBS volumes to attach"
  type = list(object({
    device_name           = string
    size                  = number
    type                  = string
    delete_on_termination = optional(bool, true)
  }))
  default = [
    {
      device_name           = "/dev/sdh"
      size                  = 20
      type                  = "gp2"
      delete_on_termination = true
    }
  ]
}

variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
  default     = 2
}

variable "tag" {
  description = "Tag value"
  type        = string
  default     = "node"
}
