terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc1"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://proxmox.rossreicks.com:8006/api2/json"
}

resource "proxmox_vm_qemu" "radarr" {
  count       = 1
  name        = "radarr"
  target_node = var.proxmox_host
  clone       = var.template_name
  agent       = 1
  os_type     = "cloud-init"
  cores       = 2
  sockets     = 1
  cpu         = "host"
  memory      = 2048
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"
  disks {
    scsi {
      scsi0 {
        disk {
          storage  = "local-lvm"
          size     = 10
          iothread = true
        }
      }
    }
  }
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  ipconfig0 = "ip=192.168.0.181/32,gw=192.168.0.1"

  ssh_user = "root"
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}

# resource "proxmox_lxc" "basic" {
#   target_node  = "pve"
#   hostname     = "lxc-basic"
#   ostemplate   = "local:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz"
#   password     = "BasicLXCContainer"
#   unprivileged = true

#   // Terraform will crash without rootfs defined
#   rootfs {
#     storage = "local-lvm"
#     size    = "8G"
#   }

#   network {
#     name   = "eth0"
#     bridge = "vmbr0"
#     ip     = "dhcp"
#   }
# }
