data "newrelic_entity" "entity" {
  for_each = var.entity-tags

  name   = each.value.entity-details.name
  type   = each.value.entity-details.type
  domain = each.value.entity-details.domain
}

resource "newrelic_entity_tags" "tags" {
  for_each = var.entity-tags
  guid = data.newrelic_entity.entity[each.key].guid

  dynamic "tag" {
    for_each = each.value.tag-details

    content {
      key    = tag.key
      values = tag.value
    }
  }
}