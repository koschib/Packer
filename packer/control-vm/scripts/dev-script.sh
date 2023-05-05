## Shell Script to install terraform cli, argocd cli, kubectl
## To avoid debconf: unable to initialize frontend: Dialog
sudo apt-get install dialog apt-utils -y

# Install Terraform
echo "Installing Terraform"
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" -y
sudo apt-get update && sudo apt-get install terraform -y

# Install ArgoCD CLI for Linux
echo "Installing ArgoCD CLI"
sudo curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64
sudo chmod +x /usr/local/bin/argocd



# Install Kubectl
#echo "Installing Kubectl"
#sudo apt-get install -y apt-transport-https ca-certificates curl
#sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
#sudo echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
#sudo apt-get update && sudo apt-get install -y kubectl

# Install Helm
echo "Installing Helm"
sudo curl -sSL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | sudo bash
sudo apt-get install -y bash-completion
sudo helm completion bash > /etc/bash_completion.d/helm


# Install Gitlab CLI
echo "Installing Gitlab CLI"
sudo apt install gitlab-cli
sudo chmod +x /usr/local/bin/gitlab

# Install Gitlab Runner
echo "Installing Gitlab Runner"
sudo curl -sSL https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash
sudo apt-get install gitlab-runner -y

# # Install jq
echo "Installing jq"
#sudo apt-get install jq -y

# # Install k9s
#echo "Installing k9s"


 # Install kubectx
 #echo "Installing kubectx"
 #sudo curl -sSL -o /usr/local/bin/kubectx
 #sudo chmod +x /usr/local/bin/kubectx

# # Install kubens
# echo "Installing kubens"
# sudo curl -sSL -o /usr/local/bin/kubens
# sudo chmod +x /usr/local/bin/kubens

# # Install kubeseal
# echo "Installing kubeseal"
# sudo curl -sSL -o /usr/local/bin/kubeseal
# sudo chmod +x /usr/local/bin/kubeseal

# # Install trivy
# echo "Installing trivy"
# sudo curl -sSL -o /usr/local/bin/trivy
# sudo chmod +x /usr/local/bin/trivy

