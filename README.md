# devops-automation-challenge
DevOps Automation Challenge
===========================

1. Deploy a Kubernetes Cluster
------------------------------

Terraform configuration file for cluster creation is located in folder **azure**.

To apply the configuration run the following steps:

1. **terraform init** if the repository was just cloned.
2. **terraform plan** if you would like to view the changes that would be applied.
3. **terraform apply** to apply the plan and deploy the cluster if it does not yet exist.

To remove only the cluster run:

**terraform destroy -target azurerm_kubernetes_cluster.kubernetes**

There is also a script called **destroy-cluster.bat** in place for convenience.

To get the credential for kubectl run:

**az aks get-credentials --resource-group Silvio001 --name kubernetes-1**

There is also a script called **get-credentials.bat** in place for convenience.