@ECHO OFF
az aks show --resource-group Silvio002 --name kubernetes-2 --query addonProfiles.httpApplicationRouting.config.HTTPApplicationRoutingZoneName -o table