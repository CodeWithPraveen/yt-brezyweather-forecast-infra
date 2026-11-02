// Forecast data storage for the BrezyWeather forecast API

@description('Azure region for the forecast storage account')
param location string = resourceGroup().location

@description('Storage account name prefix; an 8-character unique suffix is added')
@maxLength(16)
param storagePrefix string

@description('Storage account redundancy SKU')
param storageSku string = 'Standard_LRS'

@description('Governance tags applied to the storage account')
param tags object

// Storage account names are global, so add a suffix that is stable for this resource group
var storageAccountName = '${storagePrefix}${take(uniqueString(resourceGroup().id), 8)}'

resource forecastStorage 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: storageSku
  }
  kind: 'StorageV2'
  tags: tags
  properties: {
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    supportsHttpsTrafficOnly: true
  }
}

output storageAccountName string = forecastStorage.name
output storageSku string = forecastStorage.sku.name
