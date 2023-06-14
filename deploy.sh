#!/bin/bash
read -p "DigitalOcean Token: " TF_VAR_do_token
terraform init
terraform apply -auto-approve
echo "Waiting 30 seconds for VMs to come online..."
sleep 30
ansible-playbook nginx.yaml --inventory=inventory.ini