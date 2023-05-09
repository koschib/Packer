#!/bin/bash

## debconf: unable to initialize frontend: Dialog
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections


# Terraform Installation ok
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl unzip
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install -y terraform

# Argocd cli Installation ok
sudo curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo chmod +x /usr/local/bin/argocd

# kubectl Installation ok
sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2 curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update && sudo apt-get install -y kubectl

# Helm Installation #### ok
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm

# Gitlab cli Installation ?????
sudo apt-get update && sudo apt-get install -y git
sudo curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
sudo apt-get install -y gitlab-ee

# Gitlab Runner Installation
sudo apt-get update && sudo apt-get install -y git
curl -LJO "https://gitlab-runner-downloads.s3.amazonaws.com/latest/deb/gitlab-runner_amd64.deb"
sudo dpkg -i gitlab-runner_amd64.deb

# jq cli Installation ok
sudo apt-get update && sudo apt-get install -y jq

# k9s Installation test
sudo apt-get update && sudo apt-get install -y derailed/k9s/k9s

# kubens and kubeseal Installation
sudo apt-get update && sudo apt-get install -y kubectx

# trivy Installation
wget https://github.com/aquasecurity/trivy/releases/download/v0.19.2/trivy_0.19.2_Linux-64bit.deb
sudo dpkg -i trivy_0.19.2_Linux-64bit.deb