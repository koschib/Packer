


# Terraform Installation 
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl unzip
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install -y terraform

# Argocd cli Installation 
sudo curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo chmod +x /usr/local    /bin/argocd

# kubectl Installation 
sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2 curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update && sudo apt-get install -y kubectl

# Helm Installation 
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm

# Gitlab cli Installation 
sudo apt-get update && sudo apt-get install -y git
sudo curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
sudo apt-get install -y gitlab-ee
sudo apt install gitlab-cli -y

# Gitlab Runner Installation
sudo apt-get update && sudo apt-get install -y git
curl -LJO "https://gitlab-runner-downloads.s3.amazonaws.com/latest/deb/gitlab-runner_amd64.deb"
sudo dpkg -i gitlab-runner_amd64.deb

# jq cli Installation 
sudo apt-get update && sudo apt-get install -y jq

# k9s Installation no ok
sudo apt-get update && sudo snap install k9s

# kubens and kubeseal Installation testing not ok
curl -LO https://github.com/ahmetb/kubectx/releases/latest/download/kubens
chmod +x kubens
sudo mv kubens /usr/local/bin/


curl -LO https://github.com/bitnami-labs/sealed-secrets/releases/latest/download/kubeseal-linux-amd64
chmod +x kubeseal-linux-amd64
sudo mv kubeseal-linux-amd64 /usr/local/bin/kubeseal

# kubectx installation

curl -LO https://github.com/ahmetb/kubectx/releases/latest/download/kubectx
chmod +x kubectx
sudo mv kubectx /usr/local/bin/

# trivy Installation ok
sudo apt-get install wget apt-transport-https gnupg lsb-release
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install trivy

# install keycloack client

exit 0












