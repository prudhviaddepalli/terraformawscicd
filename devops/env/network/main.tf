resource "confluent_network" "private-link" {
  display_name     = "Private Link Network"
  cloud            = "AWS"
  region           = var.region
  connection_types = ["PRIVATELINK"]
  zones            = keys(var.subnets_to_privatelink)
  environment {
    id = confluent_environment.env.id
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
    id = confluent_environment.env.id
  }
  network {
    id = confluent_network.private-link.id
  }
}
