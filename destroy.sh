#!/bin/bash
read -p "DigitalOcean Token: " TF_VAR_do_token
terraform destroy -auto-approve
