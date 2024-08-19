module "entity_tags" {
    # for_each = var.tagging
    source = "./modules/tags"
    nr_account_id = var.nr_account_id
    nr_api_key = var.nr_api_key
    region = var.region
    entity-tags = var.tagging
    # providers = {
    #     newrelic = newrelic
    # }
}

module "drop-rules" {
  source = "./modules/drop-rule"
  nr_account_id = var.nr_account_id
  nr_api_key = var.nr_api_key
  region = var.region
  drop-rules = var.drop-rules
}

module "log-parsing" {
    source = "./modules/log-parsing"
    nr_account_id = var.nr_account_id
    nr_api_key = var.nr_api_key
    region = var.region
    parsing-rules = var.parsing-rules
}

module "synthetics" {
    source = "./modules/synthetic-monitoring"
    nr_account_id = var.nr_account_id
    nr_api_key = var.nr_api_key
    region = var.region
    synthetics-details = var.synthetics-details
}