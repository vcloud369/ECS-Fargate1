resource "aws_security_group" "ecs_security_group" {
  name        = "ecs_sg"
  description = "Allow all inbound and outbound traffic for ECS containers"
  vpc_id      = aws_vpc.main.id
}

resource "aws_iam_role" "ecs_task_role" {
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Effect   = "Allow"
        Sid      = ""
      },
    ]
  })
}
