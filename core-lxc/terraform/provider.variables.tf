variable "proxmox_url" {
    type = string
}

variable "pm_api_token_id" {
    type = string
}

variable "pm_api_token_secret" {
    type = string
}

variable "ssh_key" {
    type = string
}

variable "network_gw_ip" {
  type    = string
  default = "192.168.1.254"
}
