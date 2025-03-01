# Check if 'patient-service' ECR repository exists using Terraform's 'aws_ecr_repository' with 'count' logic
resource "aws_ecr_repository" "patient_service" {
  count = (length(aws_ecr_repository.patient_service) == 0) ? 1 : 0

  name              = var.patient_service_repo_name
  image_tag_mutability = "MUTABLE"
}

# Check if 'appointment-service' ECR repository exists using Terraform's 'aws_ecr_repository' with 'count' logic
resource "aws_ecr_repository" "appointment_service" {
  count = (length(aws_ecr_repository.appointment_service) == 0) ? 1 : 0

  name              = var.appointment_service_repo_name
  image_tag_mutability = "MUTABLE"
}
