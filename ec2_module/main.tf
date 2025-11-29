terraform {
	required_version = ">= 1.0"
	required_providers {
		aws = {
			source  = "hashicorp/aws"
			version = "~> 4.0"
		}
	}
}

locals {
	merged_tags = merge({ Name = var.name }, var.tags)
	sg_ids = length(var.vpc_security_group_ids) > 0 ? var.vpc_security_group_ids : aws_security_group.this[*].id
}


esource "aws_instance" "server" {
  count = var.instance_count

  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = var.security_group_ids


}

	dynamic "ebs_block_device" {
		for_each = var.ebs_volumes
		content {
			device_name           = ebs_block_device.value.device_name
			volume_size           = ebs_block_device.value.size
			volume_type           = ebs_block_device.value.type
			delete_on_termination = try(ebs_block_device.value.delete_on_termination, true)
		}
	}

  tags = {
    Name = "server-${count.index + 1}"
  }

