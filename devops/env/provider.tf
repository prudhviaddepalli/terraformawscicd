terraform {
  required_version = ">= 0.14.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.17.0"
    }
    confluent = {
      source  = "confluentinc/confluent"
      version = "1.55.0"
    }

   azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.55.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "terraformcicd"
    container_name       = "terraformcicd"
  }
  
}

provider "confluent" {
  cloud_api_key    = var.confluent_cloud_api_key
  cloud_api_secret = var.confluent_cloud_api_secret
}
