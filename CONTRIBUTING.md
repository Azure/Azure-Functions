# Contributing to Azure Functions

Azure Functions welcomes contributions and suggestions. One of the easiest ways to contribute is to participate in discussions on GitHub issues. You can also contribute by submitting pull requests with code changes or documentation updates. If you have any questions, please ask a project maintainer.

Not all repositories related to Azure Functions adhere to the processes discussed in this guide. In interacting with any repository, it is suggested that you confirm the specific contribution guidelines and process for that repo. This guide covers the baseline standards for most repositories managed by the Azure Functions team.

Contents:
- [Code of conduct](#code-of-conduct)
- [Reporting issues](#reporting-issues)
- [Submitting a pull request](#submitting-a-pull-request)
- [Creating documentation and samples](#creating-documentation-and-samples)
- [Repository index](#azure-functions-repositories)

## Code of conduct

Azure Functions projects have adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).  For more information, see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Reporting issues

For non-security related bugs, please log an issue on the appropriate GitHub repository. If you're not sure which repository to go to or have a general issue, please log an issue on the [Azure/Azure-Functions issue tracker](https://github.com/Azure/Azure-Functions/issues).

### Reporting security issues and bugs
Security issues and bugs should be reported privately, via email, to the Microsoft Security Response Center (MSRC): secure@microsoft.com. You should receive a response within 24 hours. If for some reason you do not, please follow up via email to ensure we received your original message. Further information, including the MSRC PGP key, can be found in the [Security TechCenter](https://technet.microsoft.com/en-us/security/ff852094.aspx).

### Label glossary

A common set of labels, described in this section, are used across repositories managed by the Azure Functions team. A given repository may use additional issues. Be sure to check that repository's contribution guide or ask a maintainer if you have any questions.

| Label               | Description                                                                                        |
|---------------------|----------------------------------------------------------------------------------------------------|
| bug                 | Refers to a product bug                                                                            |
| feature-request     | Refers to a request for a new feature                                                              |
| good-first-issue    | Identifies an issue the maintainers have highlighted as a good starting point for new contributors |
| help-wanted         | Identifies an issue for which community contribution has been explicitly requested                 |
| needs-discussion    | Marks an item as needing additional discussion and detail                                          |
| needs-investigation | Marks an item as needing investigation                                                             |
| question            | Refers to questions not related to a specific bug or feature request                               |
| wontfix             | Marks an item that will not be fixed                                                               |


### Milestone glossary

A common set of milestones, described in this section, are used across repositories managed by the Azure Functions team. A given repository may use additional milestones. Be sure to check that repository's contribution guide or ask a maintainer if you have any questions.

| Milestone                     | Description                                                                                                                                                                       |
|-------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Active Questions / Discussion | Refers to items where someone is actively investigating or answering a question. Items in this milestone should always have an owner.                                             |
| Backlog                       | Refers to items that may need additional design or are expected to be delivered outside of the next 6 months                                                                      |
| Sprint _X_                    | Refers to a specific work sprint during which this should be resolved                                                                                                             |
| Triaged                       | Refers to items for which design is mostly understood and for which delivery should be within a 6 month period. Items in this milestone may just be waiting on sprint assignment. |
| Unknown                       | Refers to any item for which no guarantees can be made. This is often a place for discussions and design.                                                                         |

## Submitting a pull request

Azure Functions welcomes pull requests. However, we ask that if you wish to address an issue tracked in one of our repositories that is not flagged with the `help-wanted` label, please check in with the maintainers to make sure work is not already in progress.

Your pull request will now go through extensive checks by the project maintainers. Please be patient; the team operates a number of repositories and is often busy with their own contributions and service maintenance. We will try to get to your pull request as soon as we can. Please note that you may be asked to rebase or target a different branch as part of the review process, especially if other changes have been merged which would create a conflict.

The general flow for making a change to an Azure Functions repository is:
1. 🍴 Fork the repo (add the fork via `git remote add me <clone url here>`
2. 🌳 Create a branch for your change (generally use dev) (`git checkout -b my-change`)
3. 🛠 Make your change
4. ✔️ Test your changes
5. ⬆️ Push your changes to your fork (`git push me my-change`)
6. 💌 Open a PR to the dev branch
7. 📢 Address feedback and make sure tests pass (yes even if it's an "unrelated" test failure)
8. 📦 [Squash](https://git-scm.com/docs/git-rebase) your changes into a meaningful commits (usually 1 commit) (`git rebase -i HEAD~N` where `N` is commits you want to squash)
9. :shipit: Rebase and merge (This will be done for you if you don't have contributor access)
10. ✂️ Delete your branch (optional)

Most contributions require you to agree to a Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant the project the rights to use your contribution. For details, visit https://cla.microsoft.com. When you submit a pull request, a CLA-bot will automatically determine whether you need to provide a CLA and decorate the PR appropriately (e.g., label, comment). Simply follow the instructions provided by the bot. This needs to only be done once for any .NET Foundation OSS project.

Some repositories, such as [Azure/azure-functions-host](https://github.com/Azure/azure-functions-host) include an automated integration test suite. This will only be run when a project maintainer has provided initial review and may involve your changes being moved to a test branch. It is encouraged that you set up an environment to test these yourself before submitting.

If you have any questions about the process, please ask the project maintainers.

### Labal glossary

A common set of labels, described in this section, are used across repositories managed by the Azure Functions team. A given repository may use additional issues. Be sure to check that repository's contribution guide or ask a maintainer if you have any questions.

| Label                | Description                                                                             |
|----------------------|-----------------------------------------------------------------------------------------|
| cla-already-signed   | The Contributor License Agreement has already been signed by the author                 |
| cla-not-required     | The scope of the change does not require the signing of a Contributor License Agreement |
| cla-required         | The author needs to sign a Contributor License agreement                                |
| cla-signed           | The author has signed the Contributor License Agreement                                 |
| community            | The author of the pull request is not one of the project maintainers                    |
| do-not-merge         | The pull request should not be merged by a project maintainer                           |
| pr-changes-requested | A project maintainer has requested changes and is awaiting updates from the author      |
| pr-expired           | Requested changes were not provided within an expected time window.                     |
| pr-in-review         | A project maintainer is reviewing the pull request                                      |

## Creating documentation and samples

There are a variety of ways you can contribute to Functions content. In addition to those discussed in this section, updates to repository readmes, wikis, or code comments are always welcome.

The primary Functions documentation on [docs.microsoft.com](https://docs.microsoft.com) is open source on [MicrosoftDocs/azure-docs](https://github.com/MicrosoftDocs/azure-docs). You can learn more about contributing to the docs at the repo or by following the [Microsoft Docs Contributor Guide](https://docs.microsoft.com/contribute/). 

The [Serverless Community Library](https://serverlesslibrary.net) is a catalog of community samples that can be deployed right away. You can submit a sample to the library by following the [Serverless Library contribution guide](https://github.com/Azure/ServerlessLibrary#how-to-contribute-to-the-serverless-library). In addition to samples, most client experiences for creating functions make use of a function template. The [templates repository](Azure/azure-functions-templates) defines templates for each supported trigger and language, as well as core sample scenarios.

## Azure Functions repositories

Azure Functions is built on work from the following repositories:

| Category            | Repository                                                                                                          | Description                                                                                                                    |
|---------------------|---------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| General             | [Azure/azure-functions](https://github.com/Azure/azure-functions)                                                   | General information and issue management                                                                                       |
| General             | [Azure/azure-functions-premium-plan](https://github.com/Azure/azure-functions-premium-plan)                         | Documentation and issue management related to the Azure Functions Premium Plan                                                 |
| Content             | [MicrosoftDocs/azure-docs](https://github.com/MicrosoftDocs/azure-docs)                                             | Developer documentation found on [docs.microsoft.com](https://docs.microsoft.com)                                              |
| Runtime             | [Azure/azure-functions-host](https://github.com/Azure/azure-functions-host)                                         | The host runtime that powers all Azure Functions experiences                                                                   |
| Runtime             | [Azure/azure-webjobs-sdk](https://github.com/Azure/azure-webjobs-sdk)                                               | The WebJobs SDK, which provides key functionality to the runtime, as well as the Storage, Service Bus, and Event Hubs bindings |
| Runtime             | [Azure/azure-functions-docker](https://github.com/Azure/azure-functions-docker)                                     | Base docker images that include the Azure Functions host runtime                                                               |
| Binding extensions  | [Azure/azure-webjobs-sdk-extensions](https://github.com/Azure/azure-webjobs-sdk-extensions)                         | Bindings for Cosmos DB, Twilio, and SendGrid                                                                                   |
| Binding extensions  | [Azure/azure-functions-durable-extension](https://github.com/Azure/azure-functions-durable-extension)               | Bindings and issue management for Durable Functions                                                                            |
| Binding extensions  | [Azure/azure-functions-durable-js](https://github.com/Azure/azure-functions-durable-js)                             | JavaScript support for Durable Functions                                                                                       |
| Binding extensions  | [Azure/azure-functions-eventgrid-extension](https://github.com/Azure/azure-functions-eventgrid-extension)           | Bindings for Azure Event Grid                                                                                                  |
| Binding extensions  | [Azure/azure-functions-microsoftgraph-extension](https://github.com/Azure/azure-functions-microsoftgraph-extension) | Bindings for the Microsoft Graph and general authentication tokens                                                             |
| Binding extensions  | [Azure/azure-functions-signalrservice-extension](https://github.com/Azure/azure-functions-signalrservice-extension) | Bindings for Azure SignalR Service                                                                                             |
| Binding extensions  | [Azure/azure-functions-iothub-extension](https://github.com/Azure/azure-functions-iothub-extension)                 | Bindings for Azure IoT Hub                                                                                                     |
| Binding extensions  | [Azure/azure-functions-datalake-extension](https://github.com/Azure/azure-functions-datalake-extension)             | Bindings for Azure Data Lake                                                                                                   |
| Language extensions | [Azure/azure-functions-language-worker-protobuf](https://github.com/Azure/azure-functions-language-worker-protobuf) | The Protobuf contract used by all language workers                                                                             |
| Language extensions | [Azure/azure-functions-nodejs-worker](https://github.com/Azure/azure-functions-nodejs-worker)                       | The JavaScript language worker                                                                                                 |
| Language extensions | [Azure/azure-functions-python-worker](https://github.com/Azure/azure-functions-python-worker)                       | The Python language worker                                                                                                     |
| Language extensions | [Azure/azure-functions-python-library](https://github.com/Azure/azure-functions-python-library)                     | Type bindings for the Python language worker                                                                                   |
| Language extensions | [Azure/azure-functions-java-worker](https://github.com/Azure/azure-functions-java-worker)                           | The Java language worker                                                                                                       |
| Language extensions | [Azure/azure-functions-java-library](https://github.com/Azure/azure-functions-java-library)                         | Type bindings for the Java language worker                                                                                     |
| Language extensions | [Azure/azure-functions-powershell-worker](https://github.com/Azure/azure-functions-powershell-worker)               | The PowerShell language worker                                                                                                 |
| Tooling             | [Azure/azure-functions-ux](https://github.com/Azure/azure-functions-ux)                                             | Functions UI components used by the Azure portal                                                                               |
| Tooling             | [Microsoft/vscode-azurefunctions](https://github.com/Microsoft/vscode-azurefunctions)                               | The Azure Functions extension for VS Code                                                                                      |
| Tooling             | [Azure/azure-functions-core-tools](https://github.com/Azure/azure-functions-core-tools)                             | The CLI development tool for Azure Functions which provides local execution of the runtime                                     |
| Tooling             | [Azure/azure-cli](https://github.com/Azure/azure-cli)                                                               | The Azure CLI 2.0, which includes commands for function app management                                                         |
| Tooling             | [Azure/azure-functions-templates](https://github.com/Azure/azure-functions-templates)                               | Templates used for function creation gestures across clients                                                                   |
| Tooling             | [Azure/ServerlessLibrary](https://github.com/Azure/ServerlessLibrary)                                               | Provides the UI and API that powers the [Serverless Community Library](https://serverlesslibrary.net/)                         |
| Tooling             | [Azure/homebrew-functions](https://github.com/Azure/homebrew-functions)                                             | Homebrew formula for the Azure Functions Core Tools                                                                            |
| Tooling             | [Microsoft/azure-maven-plugins](https://github.com/Microsoft/azure-maven-plugins)                                   | Maven plugins                                                                                                                  |
| Tooling             | [Azure/azure-functions-tooling-feed](https://github.com/Azure/azure-functions-tooling-feed)                         | A distribution of the Core Tools and corresponding templates consumed by Visual Studio and VS Code                             |
| Tooling             | [Azure/azure-functions-vs-build-sdk](https://github.com/Azure/azure-functions-vs-build-sdk)                         | An MSBuild task for Azure Functions projects                                                                                   |
