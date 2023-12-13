
resource "confluent_environment" "env" {
  display_name = var.env_name
}

# Stream Governance and Kafka clusters can be in different regions as well as different cloud providers,
# but you should to place both in the same cloud and region to restrict the fault isolation boundary.
data "confluent_schema_registry_region" "sr" {
  cloud   = var.sr_cloud
  region  = var.sr_region
  package = var.sr_package
}

resource "confluent_schema_registry_cluster" "sr" {
  package = data.confluent_schema_registry_region.sr.package

  environment {
    id = confluent_environment.env.id
  }

  region {
    # See https://docs.confluent.io/cloud/current/stream-governance/packages.html#stream-governance-regions
    id = data.confluent_schema_registry_region.sr.id
  }
}
