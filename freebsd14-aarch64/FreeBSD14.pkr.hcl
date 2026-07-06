packer {
  required_plugins {
    parallels = {
      source  = "github.com/parallels/parallels"
      version = "~> 1.2.0"
    }
  }
}

variable "version" {
  type    = string
  default = env("VERSION")
}

source "parallels-iso" "freebsd14_aarch64" {
  iso_url            = "https://download.freebsd.org/releases/arm64/aarch64/ISO-IMAGES/14.4/FreeBSD-14.4-RELEASE-arm64-aarch64-bootonly.iso"
  iso_checksum       = "633635c0a621a2f37ce786a724cdadefc161ea6d03e0bc6a306be2df09e4d511a162e67ee8a666a9a6cbef16b892a2da3eb97ee8f3db1047837969b7975d1f69"
  ssh_username       = "vagrant"
  ssh_password       = "vagrant"
  ssh_timeout        = "10m"
  boot_command       = ["<wait10><wait10><tab><enter><wait>mkdir /tmp/etc && mount -t unionfs /tmp/etc /etc && rm /etc/resolv.conf && dhclient vtnet0 && fetch -o /tmp/fetch.sh http://{{ .HTTPIP }}:{{ .HTTPPort }}/fetch.sh && sh /tmp/fetch.sh && fetch -o /tmp/bsdinstallscript http://{{ .HTTPIP }}:{{ .HTTPPort }}/bsdinstallscript && bsdinstall script /tmp/bsdinstallscript<enter>"]
  shutdown_command   = "sudo /sbin/halt -p"
  disk_size          = "100000"
  guest_os_type      = "freebsd"
  http_directory     = "http"
  parallels_tools_mode = "disable"
  cpus               = 2
  memory             = 1024
  vm_name            = "freebsd14-aarch64"
}

build {
  sources = ["source.parallels-iso.freebsd14_aarch64"]

  provisioner "shell" {
    execute_command = "sudo {{ .Vars }} sh {{ .Path }}"
    scripts = [
      "scripts/vagrant.sh",
      "scripts/cleanup.sh",
      "scripts/zerodisk.sh"
    ]
  }

  post-processor "vagrant" {
    output               = "UNCHAINED-FreeBSD-14-aarch64-${var.version}-{{ .Provider }}.box"
    vagrantfile_template = "Vagrantfile.rb"
  }
}
