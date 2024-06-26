resource "aws_cloudwatch_log_group" "ecs_wordpress" {
  name              = "/ecs/wordpress"
  retention_in_days = 30
}

resource "aws_cloudwatch_log_group" "ecs_events" {
  name              = "/ecs/events"
  retention_in_days = 30
}
