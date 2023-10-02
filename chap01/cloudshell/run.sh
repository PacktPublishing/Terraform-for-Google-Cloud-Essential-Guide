
#!/bin/bash

# Update the package list
sudo apt-get update
# sudo yum check-update # red-hat version

# Upgrade all installed packages including kernel and kernel headers
sudo apt-get upgrade -y
# sudo yum upgrade -y # red-hat version

# Install wget and unzip
sudo apt-get install wget unzip -y
# sudo yum install wget unzip -y # red-hat version

# Download and install Terraform (used 1.5.7 because latest version)
wget https://releases.hashicorp.com/terraform/1.5.7/terraform_1.5.7_linux_amd64.zip

# Unzip the downloaded file
unzip terraform_1.5.7_linux_amd64.zip

# Move the executable to a directory in your path
sudo mv terraform /usr/local/bin/

# log version of Google Cloud SDK (assuming /usr/local/bin/ is in your PATH)
gcloud --version

# log out Terraform version (assuming /usr/local/bin/ is in your PATH)
terraform --version

# Assuming you have already downloaded and installed Google Cloud SDK authenticate with a service account (later we use an environment variable)
gcloud auth activate-service-account --key-file=~/terraform-service-account.json

# ensure gcloud.sh is executable
chmod +x gcloud.sh

# run gcloud.sh
./gcloud.sh

# run terraform

terraform init

terraform plan --out=plan.txt

terraform apply -auto-approve

terrform destroy



