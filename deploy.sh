#!/bin/bash
read -p "DigitalOcean Token: " TF_VAR_do_token; echo
if [ ! -f .terraform.lock.hcl ]; then
    INIT_RUN=true
    terraform init
fi
terraform apply -auto-approve
if [[ $INIT_RUN = "true" ]]; then
    printf "\nWaiting 30 seconds for webservers to be ready...\n"
    sleep 30
fi
ansible-playbook nginx.yaml --inventory="inventory.ini"