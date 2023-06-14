output "webserver_ips" {
	value = digitalocean_droplet.webserver[*].ipv4_address
}

locals {
  ansible_inventory = {
    ip_addresses = digitalocean_droplet.webserver[*].ipv4_address
  }
}

resource "null_resource" "ansible_inventory" {
  triggers = {
    droplet_count = length(digitalocean_droplet.webserver)
  }
  depends_on = [digitalocean_droplet.webserver]

  provisioner "local-exec" {
    command = <<-EOT
      printf "[webservers:vars]\nansible_user=root\nansible_ssh_private_key_file=/Users/mhmorris/.ssh/morrislan.pub\nansible_ssh_common_args='-o StrictHostKeyChecking=no'\n\n[webservers]\n${join("\n", local.ansible_inventory.ip_addresses)}" > inventory.ini
    EOT
  }
}
