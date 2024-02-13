resource "proxmox_lxc" "mcserver" {
    target_node     = "pve"

    # LXC Settings
    hostname        = "mcserver"
    vmid            = var.mcserver_lxcid
    ostemplate      = var.lxc_ostemplate

    # LXC Configuration Settings
    ostype          = "ubuntu"
    ssh_public_keys = var.ssh_key
    unprivileged    = true
    start           = true
    onboot          = true

    # LXC Hardware Settings
    cores = 2
    memory = 4096

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
        ip          = var.mcserver_ip
        hwaddr      = var.mcserver_mac
    }
}
