variable "aws_region" {
  description = "The AWS region to deploy resources in"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "The AWS CLI profile to use"
  default     = "default"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "private_subnets" {
  description = "List of private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  description = "List of public subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  default     = "wordpress-cluster"
}

variable "rds_identifier" {
  description = "RDS instance identifier"
  default     = "wordpress-db"
}

variable "db_username" {
  description = "Database username"
  default     = "admin"
}

variable "db_password" {
  description = "Database password"
  default     = "admin_password"
}

variable "db_name" {
  description = "Database name"
  default     = "wordpress"
}

variable "s3_bucket_name" {
  description = "S3 bucket name"
  default     = "wrdps-wordpress-media-bucket"
}

variable "ecs_task_family" {
  description = "ECS task family name"
  default     = "wordpress"
}

variable "ecr_image" {
  description = "ECR image URL"
  default     = "<aws_account_id>.dkr.ecr.us-east-1.amazonaws.com/raketech:latest"
}

variable "ecs_service_name" {
  description = "Name of the ECS service"
  default     = "wordpress-service-1"
}
