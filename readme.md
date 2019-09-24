# Azure Functions

Azure Functions is an event driven, compute-on-demand experience that extends the existing Azure application platform with capabilities to implement code triggered by events occurring in virtually any Azure or 3rd party service as well as on-premises systems. Azure Functions allows developers to take action by connecting to data sources or messaging solutions, thus making it easy to process and react to events. Azure Functions scale based on demand and you pay only for the resources you consume.

This repository acts as a directory for folks looking for the various resources we have for Azure Functions.

## Get Started with Azure Functions

To get started with Azure Functions, you can visit [functions.azure.com](https://functions.azure.com) and click on the green Get Started button. If you need a trial Azure subscription, there is also a link on that page.

## Documentation

Visit azure.com for the primary [Azure Functions documentation page](https://azure.microsoft.com/en-us/documentation/articles/functions-overview/).

If you would like documentation on the Functions runtime oriented towards contributors, those are hosted in the [Azure WebJobs SDK script GitHub wiki](https://github.com/azure/azure-webjobs-sdk-script/wiki).

## Questions & Help

If you have questions about Azure Functions, we encourage you to reach out to the community and Azure Functions dev team for help.

 - For all questions and technical help, [our MSDN forums](https://social.msdn.microsoft.com/Forums/azure/en-US/home?forum=AzureFunctions) are an easy place to have a conversation with our engineering team.
 - For questions which fit the Stack Overflow format ("*how* does this work?"), we monitor the [azure-functions](http://stackoverflow.com/questions/tagged/azure-functions) tag.
 - You can also tweet/follow [@AzureFunctions](https://twitter.com/azurefunctions).
 
While we do our best to help out in a timely basis, we don't have any promise around the above resources. If you need an SLA on support from us, it's recommended you invest in an [Azure Support plan](https://azure.microsoft.com/en-us/support/options/).

## Issues & feature requests

We track functional issues in a variety of places for Azure Functions. If you have found an issue or have a feature request, please submit an issue to the below repositories.

|Item|Description|Link|
|----|-----|-----|
|Documentation|Docs for Azure Functions features + getting started|[File an Issue](https://github.com/azure/azure-functions/issues)|
|Runtime|Script Host, Triggers & Bindings, Language Support|[File an Issue](https://github.com/Azure/azure-functions-host/issues)|
|Core Tools|Command line interface for local development|[File an Issue](https://github.com/Azure/azure-functions-core-tools/issues)|
|Dev Tools|Visual Studio and VS Code|[File an Issue](https://github.com/Azure/azure-functions/issues)|
|Portal|User Interface or Experience Issue|[File an Issue](https://github.com/azure/azure-functions-ux/issues)|
|Templates|Code Issues with Creation Template|[File an Issue](https://github.com/Azure/azure-functions-templates/issues)|
|Azure CLI|Create and manage function apps in Azure (`az functionapp`) | [File and Issue](https://github.com/Azure/azure-cli/issues) |

Before filing an issue, please check that it doesn't already exist. If you're not sure if you should file an issue, you can open up an [MSDN forum question](https://social.msdn.microsoft.com/Forums/azure/en-US/home?forum=AzureFunctions). We also have a [uservoice feedback site](https://feedback.azure.com/forums/355860-azure-functions) which we can track your feature requests through.

## Helpful links

### Get started

 - [functions.azure.com](https://functions.azure.com)

### Questions & Feedback

 - [Azure Functions forum](https://social.msdn.microsoft.com/Forums/azure/en-US/home?forum=AzureFunctions)
 - [`azure-functions` Stack Overflow tag](http://stackoverflow.com/questions/tagged/azure-functions)
 - [Azure Functions feedback site](https://feedback.azure.com/forums/355860-azure-functions)
 - [Follow @AzureFunctions twitter](https://twitter.com/azurefunctions)

### GitHub repositories

 - [Azure Functions Host](https://github.com/Azure/azure-functions-host/) - the Azure Functions runtime/host
 - [Azure WebJobs SDK](https://github.com/Azure/azure-webjobs-sdk/) - the "core" of the Azure Functions runtime and many bindings
 - [Azure WebJobs SDK extensions](https://github.com/Azure/azure-webjobs-sdk-extensions/) - the repositories of many bindings
 - [Durable Functions](https://github.com/Azure/azure-functions-durable-extension/) - the Durable Functions binding extension
 - [Durable Functions for JavaScript](https://github.com/Azure/azure-functions-durable-js) - the durable-functions npm module
 - [Azure Functions Core Tools](https://github.com/Azure/azure-functions-core-tools) - the command line tool for Azure Functions
 - [Azure Functions NodeJS Worker](https://github.com/Azure/azure-functions-nodejs-worker) - support for running JavaScript functions
 - [Azure Functions Java Worker](https://github.com/Azure/azure-functions-java-worker) - support for running Java functions
 - [Azure Functions Python Worker](https://github.com/Azure/azure-functions-python-worker) - support for running Python functions
 - [Azure Functions UX](https://github.com/azure/azure-functions-ux) - the UX for the Functions development portal
 - [Azure Functions templates](https://github.com/azure/azure-functions-templates) - the templates which show up in the Azure Functions portal, Visual Studio, Visual Studio Code, etc
 - [Azure Functions samples](https://github.com/azure/azure-webjobs-sdk-script-samples) - repository for some samples on how the runtime works
 - [Azure Functions VS Tooling](https://github.com/Azure/azure-functions-vs-build-sdk) - msbuild tasks for precompiled functions
 
### Documentation

 - [Azure Functions Overview](https://azure.microsoft.com/documentation/articles/functions-overview/)
 - [Azure Functions Concepts](https://azure.microsoft.com/documentation/articles/functions-reference/)
 - [Azure Functions C# developer reference](https://azure.microsoft.com/documentation/articles/functions-reference-csharp/)
 - [Azure Functions Node.js developer reference](https://azure.microsoft.com/documentation/articles/functions-reference-node/)
 - [Azure Functions bindings & triggers](https://azure.microsoft.com/documentation/articles/functions-triggers-bindings/)
 - [Durable Functions Overview](https://docs.microsoft.com/azure/azure-functions/durable/durable-functions-overview/)
 - [Azure Functions getting started](https://azure.microsoft.com/documentation/articles/functions-create-first-azure-function/)
 - [Azure Functions sample: webhooks](https://azure.microsoft.com/documentation/articles/functions-create-a-web-hook-or-api-function/)
 - [Azure Functions sample: event processing](https://azure.microsoft.com/documentation/articles/functions-create-an-event-processing-function/)
 - [Azure Functions sample: azure services](https://azure.microsoft.com/documentation/articles/functions-create-an-azure-connected-function/)
 - [Testing an Azure Function](https://azure.microsoft.com/documentation/articles/functions-test-a-function/)
 - [Scaling a Function](https://azure.microsoft.com/documentation/articles/functions-scale/)
 - [Building the Azure Functions runtime locally](https://github.com/Azure/azure-webjobs-sdk-script/wiki)
 
### Samples
 - [Serverless Community Library](https://serverlesslibrary.net/)
 - [Azure Functions samples](https://github.com/Azure/Azure-Functions/wiki/Samples-and-content)
 - [Durable Functions samples](https://github.com/azure/azure-functions-durable-extension)
