confluent_cloud_api_key = "${{ secrets.CONFLUENT_CLOUD_API_KEY }}"
confluent_cloud_api_secret = "${{ secrets.CONFLUENT_CLOUD_API_SECRET }}"
aws_account_id = "${{ vars.AWS_ACCOUNT_ID }}"
network_name  = "${{ vars.NETWORK_NAME }}"
network_cloud = "${{ vars.NETWORK_CLOUD }}"
network_region = "${{ vars.NETWORK_REGION }}"
environment = "env-yg5x9p"
subnets_to_privatelink = {
  "use1-az1" = "subnet-0620ef8e739b28eaa",
  "use1-az2" = "subnet-013cb394df5b1c447",
  "use1-az4" = "subnet-0de2aacb446c91fc0",
  }
topics = [ "topic1", "topic2", "topic3" , "topic4"]
