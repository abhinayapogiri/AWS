variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}
variable "existing_s3_bucket" {
  description = "Existing S3 bucket name"
  type        = string
}