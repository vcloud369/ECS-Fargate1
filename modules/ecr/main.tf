data "aws_ecr_repository" "patient_service" {
  repository_name = "patient-service"
}

resource "aws_ecr_repository" "patient_service" {
  count             = length(data.aws_ecr_repository.patient_service) == 0 ? 1 : 0
  repository_name   = "patient-service"
  image_tag_mutability = "MUTABLE"
}

data "aws_ecr_repository" "appointment_service" {
  repository_name = "appointment-service"
}

resource "aws_ecr_repository" "appointment_service" {
  count             = length(data.aws_ecr_repository.patient_service) == 0 ? 1 : 0
  repository_name   = "appointment-service"
  image_tag_mutability = "MUTABLE"
}
