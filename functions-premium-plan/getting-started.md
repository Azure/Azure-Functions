# Getting Started - Azure Functions premium plan

🚧 In order to use the Azure Functions Premium Plan private preview your subscription needs to be added to an allowlist.  Please apply for access via [http://aka.ms/functionspremium](http://aka.ms/functionspremium). 🚧

If you run into issues check our [troubleshooting docs](./troubleshooting.md)

### 1. Install the [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest) or use the [Azure Cloud Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/overview)
 
Ensure your Azure CLI is 2.0.53 or higher if running locally.

### 2. Install the preview CLI extension

```bash
az extension add --source https://functionspremium.blob.core.windows.net/sdk/functionapp-0.0.1-py2.py3-none-any.whl
``` 

**Note:** If you already have the functionapp extension installed you will need to remove it using ```az extension remove -n functionapp``` and then install the preview CLI extension above.


### 3. Create a resource group in supported region (optional)

[See the currently enabled regions](overview.md#regions)

```bash
az group create -l southcentralus -n functions-premium
```

### 4. Create an Azure Functions Premium Plan
Create a plan with 2 instances running always (number-of-workers)

```bash
az functionapp plan create -g functions-premium -n functions-premium-plan -l southcentralus --number-of-workers 2 --sku EP1
```

### 5. Set the plan to scale out to 20 workers
Set the maximum scale out of the plan to 20.  This means if the 2 instances you have running need to burst scale out more they will continue to serverlessly scale to 20 instances.

```bash
az resource update --namespace Microsoft.Web --resource-type serverfarms -g functions-premium -n functions-premium-plan --set properties.maximumElasticWorkerCount=20
```

### 6. Create and publish a function app
Now that the app is created, create and publish an app to this plan from Visual Studio or Visual Studio Code.  In Visual Studio you should see your premium plan as an option when publishing.  For VS Code you'll need to create the app first and choose it as a publish target:

```bash
# Create the storage account
az storage account create --sku Standard_LRS --location southcentralus -g functions-premium -n <storage_name> 

# Create the function app
az functionapp create -g functions-premium -s <storage_name> -p functions-premium-plan -n <function_app_name>
```

### 7. Go build awesome stuff 😎

For feedback or questions, please email functionspremium@microsoft.com


### 8. Delete your resources

Reserved instances charge you 24x7 for their full CPU and memory to be reserved to your app. When you are done testing, please delete all resources to avoid unneccessary charges.

The easiest way to do this is to delete the entire resource group containing your elastic premium plan, apps, and storage accounts

```bash
az group delete -n functions-premium
```
