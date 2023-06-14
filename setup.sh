#!/bin/bash
terraform init
terraform apply -auto-approve -var="do_token"="dop_v1_60e5658d62b03b130110b5f3aa30204d6d43315c726662c1a77e07c2713e6ab7"
echo "Waiting for VM to come online..."
sleep 30
ansible-playbook nginx.yaml --inventory=inventory.ini