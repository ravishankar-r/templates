# Declare TF variables

variable "aws_region"{
description = "Your AWS region"
type = string
}


variable "AWS_ACCESS_KEY_ID" {
  description = "Your AWS Access Key ID"
  type        = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "Your AWS Secret Key"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "resourceGroup" {
  description = "Azure resource group"
  type        = string
}

variable "subId" {
  description = "Azure subscription ID"
  type        = string
}

variable "servicePrincipalAppId" {
  description = "Azure service principal App ID"
  type        = string
}

variable "servicePrincipalSecret" {
  description = "Azure service principal App Password"
  type        = string
}

variable "servicePrincipalTenantId" {
  description = "Azure Tenant ID"
  type        = string
}

variable "admin_user" {
  description = "Guest OS Admin Username"
  type        = string
  default     = "Administrator"
}

variable "admin_password" {
  description = "Guest OS Admin Password"
  type        = string
}

variable "Ipaddress" {
  description = "IpAddress"
  type        = string
}
