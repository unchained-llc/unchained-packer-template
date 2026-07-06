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

source "parallels-iso" "freebsd15_aarch64" {
  iso_url            = "https://download.freebsd.org/releases/arm64/aarch64/ISO-IMAGES/15.1/FreeBSD-15.1-RELEASE-arm64-aarch64-bootonly.iso"
  iso_checksum       = "85192ab914601ba7fdac334868922e769f1d859523da925202a01e7f33edb4bb61003f9265581fcc374a7c18d8990367c65163cb84e52a5f0573d9c57ec68e05"
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
  vm_name            = "freebsd15-aarch64"
}

build {
  sources = ["source.parallels-iso.freebsd15_aarch64"]

  provisioner "shell" {
    execute_command = "sudo {{ .Vars }} sh {{ .Path }}"
    scripts = [
      "scripts/vagrant.sh",
      "scripts/cleanup.sh",
      "scripts/zerodisk.sh"
    ]
  }

  post-processor "vagrant" {
    output               = "UNCHAINED-FreeBSD-15-aarch64-${var.version}-{{ .Provider }}.box"
    vagrantfile_template = "Vagrantfile.rb"
  }
}
