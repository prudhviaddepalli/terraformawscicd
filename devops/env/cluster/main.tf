

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
  cloud        = data.confluent_network.private-link.cloud
  region       = data.confluent_network.private-link.region
  dedicated {
    cku = var.ckus
  }
  environment {
    id = data.confluent_environment.env.id
  }
  network {
    id = data.confluent_network.private-link.id
  }
}
