# Declare TF variables
variable "aws_region" {
  default = "ap-south-1"
}
variable "aws_availabilityzone" {
  default = "ap-south-1a"
}

variable "admin_username" {
  default = "arcadmin"
}

variable "admin_password" {
  default = "arcdemo123!!"
}

variable "azure_location" {
  default = "westus2"
}

variable "hostname" {
  default = "arc-aws-demo"
}

variable "azure_resource_group" {
  default = "Arc-AWS-Demo"
}

variable "access_key" {
}

variable "secret_key" {
}

variable "subscription_id" {
}

variable "client_id" {
}

variable "client_secret" {
}

variable "tenant_id" {
}

