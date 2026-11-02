# BrezyWeather Forecast Infrastructure

Demo repository for the Code with Praveen video "Let Claude Code Change Your Azure Infrastructure Safely". A Bicep storage account, with Claude Code permission rules that allow what-if, ask before a deployment, and deny deletes.

## Requirements

- Claude Code 2.1.316 or later, signed in
- Azure CLI 2.89.0 or later with Bicep 0.48.1 or later, signed in (`az login`) to a subscription you can deploy to
- Tested on macOS

## Setup

```bash
git clone https://github.com/CodeWithPraveen/yt-brezyweather-forecast-infra && cd yt-brezyweather-forecast-infra
az group create --name rg-brezyweather-forecast-prod --location eastus   # the resource group CLAUDE.md names
az deployment group create --resource-group rg-brezyweather-forecast-prod \
  --template-file main.bicep --parameters main.prod.bicepparam           # baseline: Standard_LRS, no costCenter tag
claude                                                                   # pick "Yes, I trust this folder" (default is No, exit); allow rules apply only after that
```

## Tear down

```bash
az group delete --name rg-brezyweather-forecast-prod --yes   # run it yourself (deny rule blocks Claude)
```
