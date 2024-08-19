resource "newrelic_nrql_drop_rule" "drop_rule1" {
  for_each    = var.drop-rules
  account_id  = var.nr_account_id
  description = each.value.description
  action      = each.value.action
  nrql        = each.value.nrql
}