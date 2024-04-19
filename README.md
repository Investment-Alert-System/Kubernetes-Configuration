# Kubernets Configuration
![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
> [!NOTE]
> With this project you can setup the project

# Installation 👨‍🔧
# Server Configuration 💾
> [!IMPORTANT]
> You need docker desktop
## Kubernetes ⎈
[Installation documentation](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
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