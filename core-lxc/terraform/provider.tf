terraform {
    required_providers {
        proxmox =  {
            source = "Telmate/proxmox"
            version = "2.9.14"
        }
    }
}

provider "proxmox" {
    pm_debug = true
    pm_api_url = var.proxmox_url
    pm_api_token_id =  var.pm_api_token_id
    pm_api_token_secret = var.pm_api_token_secret
    pm_tls_insecure = true 
}
