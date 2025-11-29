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


resource "aws_instance" "server" {
	ami                         = var.ami
	instance_type               = var.instance_type
	key_name                    = var.key_name 
	associate_public_ip_address = var.associate_public_ip_address
	security_group_id           = var.security_grouo_id
    count                       = var.instance_count



	dynamic "ebs_block_device" {
		for_each = var.ebs_volumes
		content {
			device_name           = ebs_block_device.value.device_name
			volume_size           = ebs_block_device.value.size
			volume_type           = ebs_block_device.value.type
			delete_on_termination = try(ebs_block_device.value.delete_on_termination, true)
		}
	}

	tags = local.merged_tags
}
