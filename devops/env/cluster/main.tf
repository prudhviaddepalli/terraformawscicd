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
  display_name = var.cluster_name
  availability = var.cluster_availability
  cloud        = confluent_network.private-link.cloud
  region       = confluent_network.private-link.region
  dedicated {
    cku = var.ckus
  }
  environment {
    id = confluent_environment.staging.id
  }
  network {
    id = confluent_network.private-link.id
  }
}
