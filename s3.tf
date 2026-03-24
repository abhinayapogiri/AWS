#s3 bucket for storing terraform state files
data "aws_s3_bucket" "existing_bucket" {
  bucket = var.existing_s3_bucket
}