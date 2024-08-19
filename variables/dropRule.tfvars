region = "US"

drop-rules = {
    "0" = {
        description = "af"
        action      = "drop_data" # drop_data, drop_attributes, or drop_attributes_from_metric_aggregates
        nrql        = "sdfsa"
    }
}