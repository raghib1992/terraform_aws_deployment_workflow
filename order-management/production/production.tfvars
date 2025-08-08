region         = "eu-north-1"
ami_id         = "ami-0c1234567890abcdef"  # Replace with a valid AMI ID in your region
instance_type  = "t3.micro"
subnet_id      = "subnet-0abc1234567890def"  # Replace with a real subnet ID
# key_name       = "my-production-key"
instance_name  = "order-management-prod-${var.environment}"
environment    = "production"
