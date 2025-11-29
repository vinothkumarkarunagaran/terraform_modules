# EC2 Module

Simple Terraform module to create an EC2 instance (optionally creating a security group).

## Usage

Example:

```hcl
module "example_ec2" {
  source = "../ec2_module"

  name          = "example"
  ami           = "ami-0123456789abcdef0"
  instance_type = "t3.micro"
  key_name      = "my-keypair"
  subnet_id     = "subnet-01234567"

  tags = {
    Environment = "dev"
  }
}
```

If you want to use existing security groups, pass `vpc_security_group_ids = ["sg-..."]` and the module will attach them instead of creating a new SG.

## Inputs

- `ami` (string) - AMI id to use (required)
- `instance_type` (string) - Instance type (default: `t3.micro`)
- `key_name` (string) - Key pair name (optional)
- `subnet_id` (string) - Subnet id (optional)
- `vpc_security_group_ids` (list) - Use existing SGs (optional)
- `associate_public_ip_address` (bool) - Whether to associate a public IP (default: `true`)
- `user_data` (string) - User data script (optional)
- `ebs_volumes` (list) - Additional EBS volumes (optional)
- `tags` (map) - Tags to apply to resources (default: `{}`)

## Outputs

- `instance_id` - The EC2 instance id
- `public_ip` - Public IP address
- `public_dns` - Public DNS name
- `private_ip` - Private IP address
- `security_group_ids` - Security group ids attached
