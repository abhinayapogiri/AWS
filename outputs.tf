output "ec2_public_ip" {
  value = aws_instance.showgo_server.public_ip
}

output "rds_endpoint" {
  value = aws_db_instance.showgo_db.endpoint
}

output "s3_bucket_name" {
  value = data.aws_s3_bucket.existing_bucket.bucket
}