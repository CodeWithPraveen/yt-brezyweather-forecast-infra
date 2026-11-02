using './main.bicep'

param storagePrefix = 'stbwfcprod'
param storageSku = 'Standard_LRS'
param tags = {
  environment: 'prod'
  managedBy: 'bicep'
}
