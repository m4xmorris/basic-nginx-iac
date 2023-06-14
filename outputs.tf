output "ipv4_address" {
	value = digitalocean_droplet.webserver[0].ipv4_address
}

locals {
  ansible_inventory = {
    ip_addresses = [digitalocean_droplet.webserver[0].ipv4_address]
  }
}

resource "null_resource" "ansible_inventory" {
  depends_on = [digitalocean_droplet.webserver]

  provisioner "local-exec" {
    command = <<-EOT
      printf "[all]\n${join("\n", local.ansible_inventory.ip_addresses)} ansible_user=root ansible_ssh_private_key_file=/Users/mhmorris/.ssh/morrislan.pub" > inventory.ini
    EOT
  }
}
