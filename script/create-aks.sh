#Define environment variables
export MY_RESOURCE_GROUP_NAME="kntDemoAKSResourceGroup"
export REGION="japaneast"
export MY_AKS_CLUSTER_NAME="kntDemoAKSCluster"
export MY_DNS_LABEL="kntDemodnslabel"

#Create a resource group
az group create --name $MY_RESOURCE_GROUP_NAME --location $REGION

#Create an AKS cluster
az aks create --resource-group $MY_RESOURCE_GROUP_NAME --name $MY_AKS_CLUSTER_NAME --node-count 1 --generate-ssh-keys

#Connect to the cluster
az aks get-credentials --resource-group $MY_RESOURCE_GROUP_NAME --name $MY_AKS_CLUSTER_NAME

# Verification & Listing
kubectl get nodes -o wide
kubectl cluster-info


#Cleanup
# az aks delete --resource-group ${MY_RESOURCE_GROUP_NAME} --name ${MY_AKS_CLUSTER_NAME}
# az group delete --resource-group ${MY_RESOURCE_GROUP_NAME}
# az aks delete --resource-group kntDemoAKSResourceGroup --name kntDemoAKSCluster
# az group delete --resource-group kntDemoAKSResourceGroup