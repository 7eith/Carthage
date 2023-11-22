variable "lxc_ostemplate" {
    type    = string
    default = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
}

# Traefik
variable "traefik_lxcid" {
  type    = number
  default = 700
}

variable "traefik_mac" {
  type    = string
  default = "B6:1A:E1:C6:86:03"
}

variable "traefik_ip" {
  type    = string
  default = "192.168.1.70/24"
}
