variable "DO" {}
variable "PRIVATE" {}
variable "PUBLIC" {}

terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.DO
}

resource "digitalocean_ssh_key" "terraform-blah" {
  name       = "DO Terraform Exploit Lab"
  public_key = file(var.PUBLIC)
}

resource "digitalocean_droplet" "victim" {
  image              = "centos-7-x64"
  name               = "vulnerable-host"
  region             = "sgp1"
  size               = "s-1vcpu-2gb"
  monitoring         = false
  ipv6               = false
  ssh_keys           = [digitalocean_ssh_key.terraform-blah.fingerprint]

  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file(var.PRIVATE)
    timeout     = "2m"
  }

  provisioner "remote-exec" {
    scripts = [
      "bin/centos7-docker-install.sh",
      "bin/vulhub-install.sh"
    ]
  }

}

