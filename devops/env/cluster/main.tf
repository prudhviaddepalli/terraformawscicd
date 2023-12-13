data "confluent_environment" "main" {
  id = var.environment
}

data "confluent_network" "private-link" {
  id = var.network_id
  environment {
    id = var.environment
  }
}

resource "confluent_kafka_cluster" "dedicated" {
  display_name = "Privatelink"
  availability = "SINGLE_ZONE"
  cloud        = confluent_network.private-link.cloud
  region       = confluent_network.private-link.region
  dedicated {
    cku = 1
  }
  environment {
    id = confluent_environment.staging.id
  }
  network {
    id = confluent_network.private-link.id
  }
}
