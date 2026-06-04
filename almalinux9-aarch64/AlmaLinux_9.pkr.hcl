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

source "parallels-iso" "almalinux9_aarch64" {
  iso_url              = "http://ftp.iij.ad.jp/pub/linux/almalinux/9/isos/aarch64/AlmaLinux-9-latest-aarch64-boot.iso"
  iso_checksum         = "sha256:fff9af332c09542b29ac04ae61d04f3951fcb4371beefa6be80d1d9d007e9599"
  ssh_username         = "vagrant"
  ssh_password         = "vagrant"
  ssh_timeout          = "10m"
  boot_command         = ["e<wait><down><down><down><left> inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<leftCtrlOn>x<leftCtrlOff>"]
  shutdown_command     = "sudo /sbin/halt -p"
  disk_size            = "100000"
  guest_os_type        = "linux"
  parallels_tools_flavor = "lin-arm"
  http_directory       = "http"
  cpus                 = 2
  memory               = 1024
  vm_name              = "almalinux9-aarch64"
}

build {
  sources = ["source.parallels-iso.almalinux9_aarch64"]

  provisioner "shell" {
    execute_command = "sudo {{ .Vars }} sh {{ .Path }}"
    scripts = [
      "scripts/vagrant.sh",
      "scripts/vmtools.sh",
      "scripts/cleanup.sh",
      "scripts/zerodisk.sh"
    ]
  }

  post-processor "vagrant" {
    output = "UNCHAINED-AlmaLinux-9-aarch64-${var.version}-{{ .Provider }}.box"
  }
}
