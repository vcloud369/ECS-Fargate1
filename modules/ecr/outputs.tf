# Access the repository URL for patient_service
output "patient_service_repo_url" {
  value = aws_ecr_repository.patient_service[0].repository_url
}

# Access the repository URL for appointment_service
output "appointment_service_repo_url" {
  value = aws_ecr_repository.appointment_service[0].repository_url
}
