resource "aws_ecs_task_definition" "wordpress" {
  family                   = var.ecs_task_family
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "2048"
  memory                   = "4096"

  container_definitions = jsonencode([{
    name      = "wordpress"
    image     = "${aws_ecr_repository.wordpress.repository_url}:latest"
    essential = true
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-group         = "/ecs/wordpress"
        awslogs-region        = var.aws_region  # Ensure this is correctly set
        awslogs-stream-prefix = "ecs"
      }
    },
    portMappings = [{
      containerPort = 8080
      hostPort      = 8080
    }]
    environment = [
      { name = "WORDPRESS_DB_HOST", value = module.rds.db_instance_endpoint },
      { name = "WORDPRESS_DB_USER", value = var.db_username },
      { name = "WORDPRESS_DB_PASSWORD", value = var.db_password },
      { name = "WORDPRESS_DB_NAME", value = var.db_name },
      { name = "WORDPRESS_PLUGINS", value = "all" },
      { name = "S3_UPLOADS_BUCKET", value = var.s3_bucket_name }, 
      { name = "S3_UPLOADS_REGION", value = var.aws_region },
      { name = "S3_UPLOADS_USE_INSTANCE_PROFILE", value = "true" }

    ]
  }])

  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn      = aws_iam_role.ecs_task_execution_role.arn
}
