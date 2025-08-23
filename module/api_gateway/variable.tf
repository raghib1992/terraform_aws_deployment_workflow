##############################
# API Gateway 
##############################
variable "api_name" {
  description = "The name of the API Gateway"
  type        = string
}

variable "api_description" {
  description = "The description of the API Gateway"
  type        = string
}

variable "tags" {
  description = "The tags to assign to the API Gateway"
  type        = map(string)
}


variable "endpoint_type" {
  description = "The endpoint type for the API Gateway (e.g., 'REGIONAL', 'EDGE', 'PRIVATE')"
  type        = string
}   

variable "environment" {
  description = "The environment for which the API Gateway is being created"
  type        = string
}