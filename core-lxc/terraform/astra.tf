resource "proxmox_lxc" "astra" {
    target_node     = "pve"

    # LXC Settings
    hostname        = "astra"
    vmid            = var.astra_lxcid
    ostemplate      = var.lxc_ostemplate

    # LXC Configuration Settings
    ostype          = "ubuntu"
    ssh_public_keys = var.ssh_key
    unprivileged    = true
    start           = true
    onboot          = false

    # LXC Hardware Settings
    cores = 2
    memory = 2048

    # LXC Enable Docker
    features {
        keyctl  = true
        nesting = true
    }

    # Terraform fix
    rootfs {
        storage     = "local"
        size        = "50G"
    }

    # Network Settings
    network {
        name        = "eth0"
        bridge      = "vmbr0"
        ip6         = "auto"
        gw          = var.network_gw_ip
        ip          = var.astra_ip
        hwaddr      = var.astra_mac
    }
}
