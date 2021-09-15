# Урок 3. Создание образа виртуальных машин

Задание (все делаем через CLI):
## 1. Создать новую ресурсную группу.

<code>az group create --location westeurope --name RG-CLI-03</code>
<pre>
{
  "id": "/subscriptions/43a6377e-ffc4-4f26-82c2-20411fd59e95/resourceGroups/RG-CLI-03",
  "location": "westeurope",
  "managedBy": null,
  "name": "RG-CLI-03",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": null,
  "type": "Microsoft.Resources/resourceGroups"
}
</pre>

## 2. Создать storage account.

<code>az storage account create --name sacli03 --resource-group RG-CLI-03</code>

<pre>
{
  "accessTier": "Hot",
  "allowBlobPublicAccess": null,
  "allowCrossTenantReplication": null,
  "allowSharedKeyAccess": null,
  "azureFilesIdentityBasedAuthentication": null,
  "blobRestoreStatus": null,
  "creationTime": "2021-09-15T19:06:21.482836+00:00",
  "customDomain": null,
  "enableHttpsTrafficOnly": true,
  "enableNfsV3": null,
  "encryption": {
    "encryptionIdentity": null,
    "keySource": "Microsoft.Storage",
    "keyVaultProperties": null,
    "requireInfrastructureEncryption": null,
    "services": {
      "blob": {
        "enabled": true,
        "keyType": "Account",
        "lastEnabledTime": "2021-09-15T19:06:21.592240+00:00"
      },
      "file": {
        "enabled": true,
        "keyType": "Account",
        "lastEnabledTime": "2021-09-15T19:06:21.592240+00:00"
      },
      "queue": null,
      "table": null
    }
  },
  "extendedLocation": null,
  "failoverInProgress": null,
  "geoReplicationStats": null,
  "id": "/subscriptions/43a6377e-ffc4-4f26-82c2-20411fd59e95/resourceGroups/RG-CLI-03/providers/Microsoft.Storage/storageAccounts/sacli03",
  "identity": null,
  "isHnsEnabled": null,
  "keyCreationTime": {
    "key1": "2021-09-15T19:06:21.592240+00:00",
    "key2": "2021-09-15T19:06:21.592240+00:00"
  },
  "keyPolicy": null,
  "kind": "StorageV2",
  "largeFileSharesState": null,
  "lastGeoFailoverTime": null,
  "location": "westeurope",
  "minimumTlsVersion": null,
  "name": "sacli03",
  "networkRuleSet": {
    "bypass": "AzureServices",
    "defaultAction": "Allow",
    "ipRules": [],
    "resourceAccessRules": null,
    "virtualNetworkRules": []
  },
  "primaryEndpoints": {
    "blob": "https://sacli03.blob.core.windows.net/",
    "dfs": "https://sacli03.dfs.core.windows.net/",
    "file": "https://sacli03.file.core.windows.net/",
    "internetEndpoints": null,
    "microsoftEndpoints": null,
    "queue": "https://sacli03.queue.core.windows.net/",
    "table": "https://sacli03.table.core.windows.net/",
    "web": "https://sacli03.z6.web.core.windows.net/"
  },
  "primaryLocation": "westeurope",
  "privateEndpointConnections": [],
  "provisioningState": "Succeeded",
  "resourceGroup": "RG-CLI-03",
  "routingPreference": null,
  "sasPolicy": null,
  "secondaryEndpoints": {
    "blob": "https://sacli03-secondary.blob.core.windows.net/",
    "dfs": "https://sacli03-secondary.dfs.core.windows.net/",
    "file": null,
    "internetEndpoints": null,
    "microsoftEndpoints": null,
    "queue": "https://sacli03-secondary.queue.core.windows.net/",
    "table": "https://sacli03-secondary.table.core.windows.net/",
    "web": "https://sacli03-secondary.z6.web.core.windows.net/"
  },
  "secondaryLocation": "northeurope",
  "sku": {
    "name": "Standard_RAGRS",
    "tier": "Standard"
  },
  "statusOfPrimary": "available",
  "statusOfSecondary": "available",
  "tags": {},
</pre>
  

## 3. Создать blob storage и загрузить любой файл

<code>az storage container create \
    --name storage-container-cli-03\
    --account-name sacli03</code>

{
  "created": true
}

<code>az storage blob upload \
    --account-name sacli03 \
    --container-name storage-container-cli-03 \
    --name some_text.txt \
    --file some_text.txt</code>

<pre>
Finished[#############################################################]  100.0000%
{
  "etag": "\"0x8D9787DE2603702\"",
  "lastModified": "2021-09-15T19:20:31+00:00"
}
</pre>