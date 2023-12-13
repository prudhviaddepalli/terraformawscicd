

data "confluent_environment" "env" {
  id = var.environment
}

resource "confluent_network" "private-link" {
  display_name     = var.network_name
  cloud            = var.network_cloud
  region           = var.network_region
  connection_types = ["PRIVATELINK"]
  zones            = keys(var.subnets_to_privatelink)
  environment {
    id = data.confluent_environment.env.id
  }
  dns_config {
    resolution = "PRIVATE"
  }
}

resource "confluent_private_link_access" "aws" {
  display_name = "AWS Private Link Access"
  aws {
    account = var.aws_account_id
  }
  environment {
    id = data.confluent_environment.env.id
  }
  network {
    id = confluent_network.private-link.id
  }
}
