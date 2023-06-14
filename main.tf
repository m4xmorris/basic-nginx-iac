resource "digitalocean_ssh_key" "onepassword" {
  name       = "1password"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHjgkh0LyGVjWzYnCxrKC5dxQMHE3ky7s/vFpAyjfk5l"
}

resource "digitalocean_droplet" "webserver" {
	count = 10
	name = "webserver-${count.index + 1}"
	image = "ubuntu-20-04-x64"
	region = "lon1"
	size = "s-1vcpu-1gb"
	ssh_keys = [digitalocean_ssh_key.onepassword.id]
}
