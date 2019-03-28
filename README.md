# What is Vault?

Secure, store and tightly control access to tokens, passwords, certificates, encryption keys for protecting secrets and other sensitive data using a UI, CLI, or HTTP API.

## Installation

1. First you will need kubernetes cluster. You can create one on GCP under 5mins. Once it`s ready ssh to that cluster. 

2. To start installation follow these steps:
```python
yum install git -y
yum install wget -y
yum install unzip -y
wget https://releases.hashicorp.com/terraform/0.11.11/terraform_0.11.11_linux_amd64.zip
unzip terraform_0.11.11_linux_amd64.zip
sudo mv terraform /bin/
terraform --version
terraform --help
kubectl create namespace test
git clone https://github.com/Murodbey/Terraform-vault-test.git
cd Terraform-vault-test
terraform init
terraform plan
terraform apply
```
3. Once the installation is completed please run these command to check if everything was created or no:

```python
kubectl get pods -n test
kubectl get pvc -n test
kubectl get pv -n test
kubectl get deployment -n test
```
4. Once it`s done, get the External IP for the Vault Service by running this command:

```python
kubectl get service -n test
```

and paste it on your browser. It should load Vault initial webpage where you are going to add the "token" and access your website. The "token" is "vault-root-token" and it`s also specified inside the file. 

## Possible errors

1. You might get some errors related to namespaces. If you don`t have "test" namespace, then create it using this command:

```python
kubectl create namespace test
```

or you can disable the "namespace" line in the vault-deployment.yaml file.

2. Make sure the port 8200 is not being used by any service in your cluster. It may also cause to not completing job. To be more clear, LoadBalancer will not associate any external IP to your vault service and you won`t be able to see it on the browser.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.