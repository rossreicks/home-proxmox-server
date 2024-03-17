terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.1-rc1"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://proxmox.rossreicks.com:8006/api2/json"
}

resource "proxmox_vm_qemu" "radarr" {
  count = 1
  name  = "radarr"
  target_node = var.proxmox_host
  clone = var.template_name
  agent    = 1
  os_type  = "cloud-init"
  cores    = 2
  sockets  = 1
  cpu      = "host"
  memory   = 2048
  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"
  disks {
    scsi {
        scsi0 {
            disk {
                storage = "local-lvm"
                size    = "10G"
                iothread = 1
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
  ipconfig0 = "ip=192.168.0.181/24,gw=192.168.0.1"

  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}
