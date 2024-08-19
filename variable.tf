variable "region" {
  description = "newrelic region"
  type = string
}

variable "nr_account_id" {
  description = "New Relic Account ID"
  type        = number
}

variable "nr_api_key" {
  description = "New Relic API Key"
  type        = string
}

variable "tagging" {
  type = any
}

variable "drop-rules" {
  type = any
}

variable "parsing-rules" {
  type    = any
}

variable "synthetics-details" {
  type = any
}