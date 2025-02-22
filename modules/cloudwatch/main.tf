resource "aws_cloudwatch_log_group" "patient_service_logs" {
  name = "patient-service-logs"
}

resource "aws_cloudwatch_log_group" "appointment_service_logs" {
  name = "appointment-service-logs"
}
