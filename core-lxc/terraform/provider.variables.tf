variable "proxmox_url" {
    type = string
}

variable "proxmox_user" {
    type = string
}

variable "proxmox_password" {
    type = string
}

variable "ssh_key" {
    type = string
}

variable "network_gw_ip" {
  type    = string
  default = "192.168.1.254"
}
