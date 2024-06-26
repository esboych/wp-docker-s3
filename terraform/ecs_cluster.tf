resource "aws_ecs_cluster" "wordpress_cluster" {
  name = var.ecs_cluster_name
}
