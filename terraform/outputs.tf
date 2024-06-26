output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ecs_cluster_id" {
  value = aws_ecs_cluster.wordpress_cluster.id
}

output "rds_endpoint" {
  value = module.rds.db_instance_endpoint
}

output "db_instance_username" {
  value = module.rds.db_instance_username
}

output "s3_bucket_name" {
  value = aws_s3_bucket.wordpress_media_bucket.bucket
}

output "alb_dns_name" {
  value = aws_lb.ecs_alb.dns_name
}
