@ECHO OFF
az aks show --resource-group Silvio001 --name kubernetes-1 --query addonProfiles.httpApplicationRouting.config.HTTPApplicationRoutingZoneName -o table