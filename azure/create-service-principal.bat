@ECHO OFF
az ad sp create-for-rbac --name chat-app-sp --scope "/subscriptions/dfd9452f-62fc-4e13-90f1-30b7a7e562d6/resourceGroups/Silvio001" --sdk-auth --role contributor