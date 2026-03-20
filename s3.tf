########################
# S3 Bucket
########################

resource "aws_s3_bucket" "showgo_bucket" {
  bucket = "showgo-image" # 🔥 MUST be unique

  tags = {
    Name = "showgo-image"
  }
}

########################
# Disable Block Public Access
########################

resource "aws_s3_bucket_public_access_block" "allow_public" {
  bucket = aws_s3_bucket.showgo_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

########################
# Public Read Policy
########################

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.showgo_bucket.id

  depends_on = [
    aws_s3_bucket_public_access_block.allow_public
  ]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadOnly"
        Effect    = "Allow"
        Principal = "*"
        Action    = ["s3:GetObject"]
        Resource  = "arn:aws:s3:::showgo-image/*"
      }
    ]
  })
}