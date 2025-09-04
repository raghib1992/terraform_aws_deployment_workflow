module "poc-sqs" {
  source                 = "git::git@github.com:Shake-Shack-Engineering/terraform-aws-modules.git//sqs?ref=main"
  region                 = "us-east-1"
  queue_name             = var.queue_name
  dead_letter_queue_name = var.dead_letter_queue_name
  environment            = var.environment
  project                = var.project
  # ami_id             = "ami-0de716d6197524dd9"
  # instance_type      = "t3.micro"
  # subnet_id          = "subnet-09e42151aa1caa70c" 
  # security_group_ids = "sg-0a3046aa0bf0bf9fb"
  # tags               = {
  #     Name = "poc-ec2-instance"
  # }
}