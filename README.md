# Kubernets Configuration
![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
> Following...

# Installation 👨‍🔧
# Server Configuration 💾
## Docker 🐳
```shell
# Install docker
sudo apt-get install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker

```
## Kubernetes ⎈
[Installation documentation](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
```shell
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> ~/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install kubectl

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

minikube start
```
## Terraform
[Terraform installation](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
```shell
# update everything
sudo apt-get update
sudo apt-get upgrade

# install terraform
wget https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_linux_amd64.zip
sudo apt-get install unzip
unzip terraform_1.0.0_linux_amd64.zip -d /usr/local/bin/
terraform -version
```
# Local setup
## MacOS 💻
```shell
brew install terraform
brew link terraform
brew install --cask docker
```
## Windows 🪟
```powershell
choco install terraform
choco install docker-desktop
```
# Apply Terraform 🌎
```shell
terraform init
terraform plan
terraform apply
```
## Destroy Terraform configuration 💥
```shell
terraform destroy
```