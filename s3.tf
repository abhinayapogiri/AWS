########################
# S3 Bucket
########################

resource "aws_s3_bucket" "showgo_bucket" {
  bucket = "showgo-image"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "showgo-image"
  }
}

########################
# Public Read + Write Policy
########################

resource "aws_s3_bucket_policy" "public_read_write" {

  bucket = aws_s3_bucket.showgo_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadWrite"
        Effect    = "Allow"
        Principal = "*"
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]
        Resource = "arn:aws:s3:::showgo-image/*"
      }
    ]
  })
}