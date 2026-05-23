# Configure AWS provider
provider "aws" {
  region = var.aws_region
}

# S3 bucket to store application artifacts
resource "aws_s3_bucket" "app_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "devsecops-demo"
    Environment = "dev"
  }
}

# Block all public access to the bucket
resource "aws_s3_bucket_public_access_block" "app_bucket" {
  bucket = aws_s3_bucket.app_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}