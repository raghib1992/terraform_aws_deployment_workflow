module "ec2_instance" {
  source              = "git::git@github.com:raghib1992/terraform_aws.git//ec2_module?ref=master"
  ami                 = var.ami
  instance_type       = var.instance_type
  subnet_id           = var.subnet_id
  security_group_ids  = var.security_group_ids
  tags = {
    Name        = var.instance_name
    Environment = var.environment
  }
}