#!/bin/bash
printf "\nWARN - We are about to generate a destroy plan!\n\n"
read -p "DigitalOcean Token: " TF_VAR_do_token
terraform destroy -auto-approve
