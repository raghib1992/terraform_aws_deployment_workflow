resource "aws_s3_bucket" "name" {
  bucket = "my-bucket"
    acl    = "private"
    tags = {
      Name        = "My bucket"
      Environment = "Dev"
    }
}