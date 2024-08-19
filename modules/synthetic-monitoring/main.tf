# Script API or Script Browser Synthetics Monitor
resource "newrelic_synthetics_script_monitor" "monitor" {
  for_each = try(var.synthetics-details.script_monitors, {})

  name   = each.value.name
  type   = each.value.type
  status = each.value.status

  locations_public = each.value.locations_public
  period           = each.value.period

  script = each.value.script

  script_language      = each.value.script_language
  runtime_type         = each.value.runtime_type
  runtime_type_version = each.value.runtime_type_version

}

# Broken Links Monitor
resource "newrelic_synthetics_broken_links_monitor" "broken-links" {
  for_each = try(var.synthetics-details.broken-link-monitors, {})
  name                 = each.value.name
  uri                  = each.value.uri
  locations_public     = each.value.locations_public
  period               = each.value.period
  status               = each.value.status
  runtime_type         = each.value.runtime_type
  runtime_type_version = each.value.runtime_type_version
  tag {
    key    = each.value.tag.key
    values = each.value.tag.values
  }
}

# Synthetics Certificate Check monitor
resource "newrelic_synthetics_cert_check_monitor" "cert-check-monitor" {
  for_each = try(var.synthetics-details.cert-check-monitors, {})
  name                   = each.value.name
  domain                 = each.value.domain
  locations_public       = each.value.locations_public
  certificate_expiration = each.value.certificate_expiration
  period                 = each.value.period
  status                 = each.value.status
  runtime_type           = each.value.runtime_type
  runtime_type_version   = each.value.runtime_type_version
  tag {
    key    = each.value.tag.key
    values = each.value.tag.values
  }
}

# Simple or Browser Synthetics Monitor
resource "newrelic_synthetics_monitor" "monitor" {
  for_each = try(var.synthetics-details.simple-or-browser-monitors, {})
  status           = each.value.status
  name             = each.value.name
  period           = each.value.period
  uri              = each.value.uri
  type             = each.value.type
  locations_public = each.value.locations_public

  custom_header {
    name  = each.value.name
    value = each.value.value
  }

  validation_string                       = each.value.validation_string
  verify_ssl                              = each.value.verify_ssl

  # browser monitor
  enable_screenshot_on_failure_and_script = try(each.value.enable_screenshot_on_failure_and_script, null)
  runtime_type                            = try(each.value.runtime_type, null)
  runtime_type_version                    = try(each.value.runtime_type_version, null)
  script_language                         = try(each.value.script_language, null)
  device_type                             = try(each.value.device_type, null)
  device_orientation                      = try(each.value.device_orientation, null)

  #simple monitor
  treat_redirect_as_failure = try(each.value.treat_redirect_as_failure, null)
  bypass_head_request       = try(each.value.bypass_head_request, null)

  tag {
    key    = each.value.tag.key
    values = each.value.tag.values
  }
}

# Synthetics Step monitor
resource "newrelic_synthetics_step_monitor" "step-monitor" {
  for_each = try(var.synthetics-details.step-monitors, {})
  name                                    = each.value.name
  enable_screenshot_on_failure_and_script = each.value.enable_screenshot_on_failure_and_script
  locations_public                        = each.value.locations_public
  period                                  = each.value.period
  status                                  = each.value.status
  runtime_type                            = each.value.runtime_type
  runtime_type_version                    = each.value.runtime_type_version
  steps {
    ordinal = each.value.steps.ordinal
    type    = each.value.steps.type
    values  = each.value.steps.values
  }
  tag {
    key    = each.value.tag.key
    values = each.value.tag.values
  }
}