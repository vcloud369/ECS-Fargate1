# Check if patient-service repository exists
resource "null_resource" "check_patient_service_repo" {
  provisioner "local-exec" {
    command = "aws ecr describe-repositories --repository-names ${var.patient_service_repo_name} || true"
  }
}

# Create patient-service repository if it doesn't exist
resource "aws_ecr_repository" "patient_service" {
  depends_on = [null_resource.check_patient_service_repo]
  name       = var.patient_service_repo_name
  image_tag_mutability = "MUTABLE"
}

# Check if appointment-service repository exists
resource "null_resource" "check_appointment_service_repo" {
  provisioner "local-exec" {
    command = "aws ecr describe-repositories --repository-names ${var.appointment_service_repo_name} || true"
  }
}

# Create appointment-service repository if it doesn't exist
resource "aws_ecr_repository" "appointment_service" {
  depends_on = [null_resource.check_appointment_service_repo]
  name       = var.appointment_service_repo_name
  image_tag_mutability = "MUTABLE"
}
