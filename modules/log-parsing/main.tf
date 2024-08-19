resource "newrelic_log_parsing_rule" "foo"{
    for_each = var.parsing-rules
    account_id = var.nr_account_id
    name        = each.value.name
    grok        = each.value.grok
    lucene      = each.value.lucene
    enabled     = each.value.enabled
    nrql        = each.value.nrql
    attribute   = each.value.attribute
    matched     = each.value.matched
}