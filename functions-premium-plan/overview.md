# Overview - Azure Functions premium plan

🚧 In order to use the Azure Functions Premium Plan private preview your subscription needs to be added to an allowlist.  Please apply for access via [http://aka.ms/functionspremium](http://aka.ms/functionspremium). 🚧

The Azure Functions premium plan is a new hosting option for function apps that provides premium features like VNet connectivity, no cold start, and premium hardware, without having to compromise on things like latency or scale.

A function app deployed to Azure can easily be moved between consumption and premium plans.  Multiple function apps can also run within the same premium plan (and may share resources with those workers).  Both premium and consumption plans are charged per second per the compute used.  One distinction with the premium plan is you are charged for the cores and memory per worker running, regardless of how many apps or executions are active at the time within that worker.  Full details on pricing [can be found on the Azure pricing page](https://azure.microsoft.com/pricing/details/functions/)

## Features

Below highlights some of the main features provided in the Azure Functions premium plan.

### VNet connectivity

Azure Functions deployed to a premium plan can take advantage of all the VNet features now [provided inside of App Service Plans](https://blogs.msdn.microsoft.com/appserviceteam/2018/10/17/new-app-service-vnet-integration-feature/).  Initially this means the ability to enable the function for outbound traffic into a secured VNet.  You can also use IP allowlists and restrictions on the app to restrict incoming traffic.  In the near future we will also enable service endpoint configuration for incoming traffic to a premium function.

When creating the subnet for your premium function plan, be sure to provide enough IP addresses for all potential workers that will scale out (see the scale section below).  You can configure the maximum scale out for the plan, but could be as large as 100 workers (or 400 active cores). 

### Serverless scale

Azure Functions in a consumption plan today scale extremely rapidly (both out and in) based on the rate of events to be processed.  This enables functions to proactively scale and process large bursts as necessary.

Functions deployed into an Azure Functions premium plan will also take advantage of this rapid and proactive scale out and scale in.  This enables your worker and core count to dynamically grow based on the needs of the events and apps currently running in a serverless way.

The number of workers of a plan can be set - which will set a reserved set of workers for your apps to enable capabilities like always on and primed scale-out.

#### Plan - Billing & Number of Workers

The number of workers are the number of workers that will be reserved specifically for you and your apps.  The minimum workers for a premium plan is 2, and the maximum is 20.  These workers are specifically reserved and running for you 24x7. The workers will be intelligently used as described in the [high density section](#high-density-computing).  **You will be charged for each worker while it is reserved for you.**

Today you can select from 3 worker sizes that will be used across your worker count and your max scaled out workers.  

|SKU|Cores|Memory|Storage|
|--|--|--|--|
|EP1|1|3.5GB|250GB|
|EP2|2|7GB|250GB|
|EP3|4|14GB|250GB|

### High density computing

For certain workloads you may have many apps as part of a single solution.  It may even make sense for all of those apps to run within the same pool of workers (for things like uniform VNet and subnet connectivity).  Azure Functions premium plan enables you to deploy multiple apps within the same plan, and those apps will intelligently leverage available workers on a per-app basis.  

For example, lets say I have 10 workers in my plan and 20 apps deployed to it.  If apps 1-19 run infrequently or at a lower rate, they may all only be running on a single worker.  If app 20 is running at high scale, it may be running across all 10 workers.  The Azure Functions scale controller will automatically and intelligently optimize your function apps across available workers to enable efficient utilization of available resources in a serverless way.

### Unbounded run duration

Azure Functions in a consumption plan are limited to 10 minutes maximum run duration.  In an Azure Function premium plan that run duration is unbounded.  By default we will limit you to 30 minutes (mostly to prevent against runaway executions) but you can [modify the host.json](https://docs.microsoft.com/en-us/azure/azure-functions/functions-host-json#functiontimeout) to make this unbounded.

## Regions

Below is the currently supported regions for the preview.  If you would like to see other regions added, please add (or upvote) an issue in this repo with the appropriate title and description.

|Region|
|--|
|South Central US|
|West Europe|
|Australia East|
|Australia Southeast|

## Configuration

There are a few optional configuration points you can leverage in a premium plan.

#### Plan - Max Scale Out

The max scale out number is the maximum number of workers your plan can scale out to.  This must be at least the same number of workers, but can be as large as 100 (or 400 cores).  This will be the maximum number of workers your plan will serverlessly scale out to under load.  You will only be charged for these scaled out workers while they are running and rented to you.  We will make a best effort at scaling your app out to its defined max scale out, whereas [a plan worker count](#plan---number-of-workers) is guaranteed available for your app.

For example, let's say you have a premium plan with an worker count of 10, and a max scale out of 50.  As the apps within the plan scale out, they will eventually utilize all 10 workers reserved in the plan. However the app can continue to scale out into new workers (using the same rapid scale out logic as consumption functions) until eventually 50 workers could be active.  After load decreases, the service will automatically scale your plan back down to 10 workers, and your app could scale down to only run on the number of defined pre-warmed workers.

You can configure this number today via the Azure CLI:

```bash
az resource update --resource-type Microsoft.Web/serverfarms -g <resource_group> -n <premium_plan_name> --set properties.maximumElasticWorkerCount=<desired_max_scale_out>
```

### Pre-warmed workers

If no events and executions occur today in the consumption plan, we may scale you down to 0 workers. This means when new events come in we need to quickly instantiate a new worker with your app on it - which may take some time depending on the app.  This is called app 'cold start' and is an effect of serverless compute we [are continually working to improve](https://blogs.msdn.microsoft.com/appserviceteam/2018/02/07/understanding-serverless-cold-start/).  

In the Azure Functions premium plan, we allow apps to reserve and run your app always warmed on a specific number of workers.  This means if you have an app that may go from 0 events to 10,000 events at a moments notice, you could pre-warm 1 or many workers to always have that app ready to run.  As the app scales out, it will first scale into the pre-warmed workers (and continue to buffer out to warm additional workers) so you can effectively avoid cold start.  This also means for the Azure Functions premium plan we require at least one worker is running at all times the plan is active.

Today you can pre-warm only within your [worker count](#plan---worker-count).

You can configure this number today via the Azure CLI:

```bash
az resource update --resource-type Microsoft.Web/sites -g <resource_group> -n <function_app_name>/config/web --set properties.reservedInstanceCount=<desired_prewarmed_count>
```

## Feedback

For feedback of issues, please file an appropriate issue in this repo.
