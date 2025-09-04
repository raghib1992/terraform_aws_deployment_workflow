# Create EC2 instance

resource "aws_instance" "name" {
  ami           = "ami-0de716d6197524dd9"
  instance_type = "t3.micro"
  subnet_id     = "subnet-09e42151aa1caa70c"
  tags = {
    Name = "poc-ec2-instance"
  }
}
