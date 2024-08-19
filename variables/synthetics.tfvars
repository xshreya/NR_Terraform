synthetics-details = {
    broken-link-monitors = {
        "0" = {
            name                 = "Sample Broken Links Monitor"
            uri                  = "https://www.chatgpt.com"
            locations_public     = ["AP_SOUTH_1"]
            period               = "EVERY_6_HOURS"
            status               = "ENABLED"
            runtime_type         = "NODE_API"
            runtime_type_version = "16.10"
            tag = {
                key    = "some_key"
                values = ["some_value"]
            }
        }
    }    
}

