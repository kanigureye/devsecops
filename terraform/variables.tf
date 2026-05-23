variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "eu-west-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  default     = "devsecops-demo-bucket"
}