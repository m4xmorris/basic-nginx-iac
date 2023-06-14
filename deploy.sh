#!/bin/bash
read -p "DigitalOcean Token: " TF_VAR_do_token
terraform init
terraform apply -auto-approve
echo "Waiting for VM to come online..."
sleep 30
ansible-playbook nginx.yaml --inventory=inventory.ini
