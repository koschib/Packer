#!/bin/bash


# Terraform Installation 
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

# Argocd cli Installation 
sudo curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo chmod +x /usr/local    /bin/argocd

# kubectl Installation 
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
sudo echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install Helm ok
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
sudo chmod 700 get_helm.sh
sudo ./get_helm.sh

# Gitlab cli Installation 
sudo apt-get update && sudo apt-get install -y git
sudo curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
sudo apt-get install -y gitlab-ee
sudo apt install gitlab-cli -y

# Gitlab Runner Installation / Config i Rach.
sudo apt-get update && sudo apt-get install -y git
curl -LJO "https://gitlab-runner-downloads.s3.amazonaws.com/latest/deb/gitlab-runner_amd64.deb"
sudo dpkg -i gitlab-runner_amd64.deb

# jq cli Installation 
sudo apt-get update && sudo apt-get install -y jq

# k9s Installation no ok
sudo apt-get update && sudo snap install k9s

# kubens and kubeseal Installation testing not ok
curl -sS https://webi.sh/kubens | sh
sudo source ~/.config/envman/PATH.env

# kubectx installation

curl -LO https://github.com/ahmetb/kubectx/releases/latest/download/kubectx
sudo chmod +x kubectx
sudo mv kubectx /usr/local/bin/

# trivy Installation ok
sudo apt-get install wget apt-transport-https gnupg lsb-release
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install trivy

# azure cli install
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

## Install openssh
sudo apt-get install openssh-server



















