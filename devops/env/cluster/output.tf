output "cluster_displayname" {
  value = confluent_kafka_cluster.dedicated.display_name
}

output "bootstrap_endpoint" {
  value = confluent_kafka_cluster.dedicated.bootstrap_endpoint
}

output "rest_endpoint" {
  value = confluent_kafka_cluster.dedicated.rest_endpoint
}

output "rbac_crn" {
  value = confluent_kafka_cluster.dedicated.rbac_crn
}

output "env_id" {
  value = confluent_kafka_cluster.dedicated.environment[0].id
}

output "network_id" {
  value = confluent_kafka_cluster.dedicated.network[0].id
}

