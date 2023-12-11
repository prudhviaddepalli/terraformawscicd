variable "aws_account_id" {
  description = "The AWS Account ID (12 digits)"
  type        = string
}

variable "region" {
  description = "The AWS Region of the existing VPC"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID to private link to Confluent Cloud"
  type        = string
}

variable "subnets_to_privatelink" {
  description = "A map of Zone ID to Subnet ID (i.e.: {\"use1-az1\" = \"subnet-abcdef0123456789a\", ...})"
  type        = map(string)
}

variable "plendpointservice" {
  description = "The private link end point service name from confluent_network.privatelink"
  type        = string
}

variable "aws_access_key" {
  description = "The aws access key"
  type        = string
}

variable "aws_secret_key" {
  description = "The aws secret key"
  type        = string
}


