## Environment Setup

```sh
xcode-select --install
brew install terraform
brew install azure-cli
az login
```

## Deploying Test Cluster

```sh
cd terraform
terraform apply
echo "$(terraform output kube_config)" > ./.azurek8s
echo "$(sed 's/\<\<EOT//' ./.azurek8s)" > ./.azurek8s && echo "$(sed 's/EOT//' ./.azurek8s)" > ./.azurek8s
export KUBECONFIG=./.azurek8s
kubectl get nodes
```

## Links

* https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-macos
* https://github.com/Azure/terraform/tree/master/quickstart
* https://www.geeksforgeeks.org/azure-vpc-using-terraform/
* https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-terraform?tabs=azure-cli
* https://learn.microsoft.com/en-us/azure/aks/learn/quick-kubernetes-deploy-terraform?pivots=development-environment-azure-cli
* https://argo-cd.readthedocs.io/en/stable/operator-manual/installation/

