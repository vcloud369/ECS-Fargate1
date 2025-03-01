# Data source to check if the patient_service repository exists
data "aws_ecr_repository" "patient_service" {
  count = length(
    try(
      [for repo in aws_ecr_repository.patient_service : repo.name],
      []
    )
  ) > 0 ? 1 : 0

  repository_name = var.patient_service_repo_name
}

# Data source to check if the appointment_service repository exists
data "aws_ecr_repository" "appointment_service" {
  count = length(
    try(
      [for repo in aws_ecr_repository.appointment_service : repo.name],
      []
    )
  ) > 0 ? 1 : 0

  repository_name = var.appointment_service_repo_name
}

# Resource: patient_service repository creation (only if it doesn't exist)
resource "aws_ecr_repository" "patient_service" {
  count             = length(data.aws_ecr_repository.patient_service) == 0 ? 1 : 0
  name              = var.patient_service_repo_name
  image_tag_mutability = "MUTABLE"
}

# Resource: appointment_service repository creation (only if it doesn't exist)
resource "aws_ecr_repository" "appointment_service" {
  count             = length(data.aws_ecr_repository.appointment_service) == 0 ? 1 : 0
  name              = var.appointment_service_repo_name
  image_tag_mutability = "MUTABLE"
}
