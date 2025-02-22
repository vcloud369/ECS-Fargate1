resource "aws_security_group" "ecs_security_group" {
  name        = "ecs_sg"
  description = "Allow all inbound and outbound traffic for ECS containers"
  vpc_id      = aws_vpc.main.id
}

resource "aws_iam_role" "ecs_task_role" {
  name               = "ecs-task-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Effect    = "Allow"
      }
    ]
  })
}

resource "aws_iam_role_policy" "ecs_task_policy" {
  name   = "ecs-task-policy"
  role   = aws_iam_role.ecs_task_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetRepositoryPolicy",
          "ecr:BatchGetImage",
          "ecs:UpdateService",
          "ecs:DescribeTasks",
          "ecs:RunTask"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}
