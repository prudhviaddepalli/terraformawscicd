variable "confluent_cloud_api_key" {
  type        = string
  description = "Confluent Cloud API KEY. export TF_VAR_confluent_cloud_api_key=\"API_KEY\""
}

variable "confluent_cloud_api_secret" {
  type        = string
  description = "Confluent Cloud API Secret. export TF_VAR_confluent_cloud_api_secret=\"API_SECRET\""
}

variable "env_name" {
  type        = string
  description = "Environment name"
}

variable "sr_cloud" {
  type        = string
  description = "Schema registry cloud provider like \"AWS\" \"GCP\" \"AZURE\" "
  default = "AWS"
}

variable "sr_region" {
  type        = string
  description = "Region of the selected cloud provider like \"us-east-2\""
  default     = "us-east-1"
}

variable "sr_package" {
  type        = string
  description = "Schema registry package name, only allowed values are ESSENTIALS, ADVANCED"
  default     = "ESSENTIALS"
}
