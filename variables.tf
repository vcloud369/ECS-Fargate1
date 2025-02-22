variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnet_cidr_1" {
  description = "CIDR block for Public Subnet 1"
  type        = string
}

variable "private_subnet_cidr_1" {
  description = "CIDR block for Private Subnet 1"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ecs_cluster_name" {
  description = "ECS Cluster Name"
  type        = string
}

variable "docker_registry_url" {
  description = "Docker registry URL"
  type        = string
}

variable "container_cpu" {
  description = "ECS container CPU"
  type        = string
  default     = "256"
}

variable "container_memory" {
  description = "ECS container memory"
  type        = string
  default     = "512"
}
