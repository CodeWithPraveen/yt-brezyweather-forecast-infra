# BrezyWeather forecast infrastructure

Bicep for the forecast API's data storage, deployed to the resource group `rg-brezyweather-forecast-prod`.

## Changing infrastructure

1. Make the change in `main.bicep` or `main.prod.bicepparam`.
2. Preview it, then show me the full what-if result and stop:

   ```bash
   az deployment group what-if --resource-group rg-brezyweather-forecast-prod --template-file main.bicep --parameters main.prod.bicepparam
   ```

3. Deploy only after I approve the what-if result:

   ```bash
   az deployment group create --resource-group rg-brezyweather-forecast-prod --name forecast-storage-update --template-file main.bicep --parameters main.prod.bicepparam
   ```

4. Verify with `az deployment group show` and `az storage account show`.
