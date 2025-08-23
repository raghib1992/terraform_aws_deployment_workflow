aws_region = "eu-north-1"
environment = "qa"

##################################
#### order api gateway variables ####
##################################
api_name = "order-api-qa"
endpoint_type = "REGIONAL"
api_description = "Order API for managing orders"
tags = {
  "Environment" = "qa"
  "Domain"     = "Order-Domain"
  "Owner"       = "DevOpsTeam"
}


####################################
### Endpoint Variables ###
####################################
# parent_path = "bucket"
# child_path  = "id"
# http_method       = "POST"
# child_http_method = "POST"
# stage_name        = "bucket-dev"