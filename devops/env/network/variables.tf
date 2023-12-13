variable "confluent_cloud_api_key" {
  type        = string
  description = "Confluent Cloud API KEY. export TF_VAR_confluent_cloud_api_key=\"API_KEY\""
}

variable "confluent_cloud_api_secret" {
  type        = string
  description = "Confluent Cloud API Secret. export TF_VAR_confluent_cloud_api_secret=\"API_SECRET\""
}

variable "environment" {
    type = string
    description = "environment id"
}

variable "aws_account_id" {
  description = "The AWS Account ID (12 digits)"
  type        = string
}

variable "network_name" {
  description = "The Network name"
  type        = string
}

variable "network_cloud" {
  description = "The cloud provider for network like AWS, GCP, AZURE"
  type        = string
  default     = "AWS"
}

variable "network_region" {
  description = "The network region like us-east-1"
  type        = string
  default     = "us-east-1"
}

variable "subnets_to_privatelink" {
  description = "A map of Zone ID to Subnet ID (i.e.: {\"use1-az1\" = \"subnet-abcdef0123456789a\", ...})"
  type        = map(string)
}
