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

data "confluent_environment" "env" {
  id = var.environment
}

data "confluent_network" "private-link" {
  id = var.network_id
  environment {
    id = var.environment
  }
}

resource "confluent_kafka_cluster" "dedicated" {
  display_name = var.cluster_name
  availability = var.cluster_availability
  cloud        = confluent_network.private-link.cloud
  region       = confluent_network.private-link.region
  dedicated {
    cku = var.ckus
  }
  environment {
    id = confluent_environment.env.id
  }
  network {
    id = confluent_network.private-link.id
  }
}
