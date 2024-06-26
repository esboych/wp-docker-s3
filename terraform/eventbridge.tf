resource "aws_cloudwatch_event_rule" "ecs_events_rule" {
  name        = "ecs-task-state-change"
  description = "Capture ECS task state change events"
  event_pattern = jsonencode({
    "source": ["aws.ecs"],
    "detail-type": [
      "ECS Task State Change",
      "ECS Container Instance State Change",
      "ECS Service Action",
      "ECS Deployment State Change"
    ]
  })
}
