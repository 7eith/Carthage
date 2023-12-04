resource "proxmox_lxc" "traefik" {
    target_node     = "pve"

    # LXC Settings
    hostname        = "traefik"
    vmid            = var.traefik_lxcid
    ostemplate      = var.lxc_ostemplate

    # LXC Configuration Settings
    ostype          = "ubuntu"
    ssh_public_keys = var.ssh_key
    unprivileged    = true
    start           = true
    onboot          = true

    # LXC Enable Docker
    features {
        keyctl  = true
        nesting = true
    }

    # Terraform fix
    rootfs {
        storage     = "local"
        size        = "20G"
    }

    # Network Settings
    network {
        name        = "eth0"
        bridge      = "vmbr0"
        ip6         = "auto"
        gw          = var.network_gw_ip
        ip          = var.traefik_ip
        hwaddr      = var.traefik_mac
    }
}
