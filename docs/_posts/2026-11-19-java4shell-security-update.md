---
title: "Java4Shell Security Updates on Azure Functions"
description: "Guidance for Azure Functions users on the Java4Shell security update."
author: "Narayan Thiru"
tags: [security]
---

> **Status note:** Azure Functions rollout details below are pending confirmation.

Oracle released Java security updates on November 17, 2026 for
CVE-2026-114938, also known as Java4Shell. Azure Functions is applying updates
to its platform-managed Java runtimes.

## Rollout status

The following status is pending confirmation:

| Platform | Availability of the update |
|---|---|
| Azure Functions - Flex Consumption | Rollout completed. |
| Azure Functions - Linux App Service | Rollout completed. |
| Azure Functions - Linux Consumption | Rollout completed. |
| Azure Functions - Linux Elastic Premium | Rollout completed. |
| Azure Functions for Windows | Rollout started; update coming soon! |

This status applies to platform-managed Java runtimes. If your application
bundles its own Java runtime or runs in a custom container, you are responsible
for updating and redeploying that runtime.

## Fixed Java release lines

The following Oracle Java builds contain the fix. Build numbers can differ
between Java distributions, so also check your runtime vendor's guidance.

| Java release line | First fixed Oracle release |
|---|---|
| Java 17 | **17.0.21.1+4** |
| Java 21 | **21.0.13.1+4** |
| Java 25 | **25.0.5.1+4** |
| Java 27 | **27.0.1.1+4** |

Not every release line in this table is a supported built-in Azure Functions
runtime. For example, Java 27 is not currently listed in the
[supported languages documentation](https://learn.microsoft.com/en-us/azure/azure-functions/supported-languages).
Availability also varies by hosting plan.

Standard OpenJDK 8 and 11 are not affected by this CVE. Oracle Java 8 Enterprise
Performance Pack is an exception; check your runtime vendor's guidance.
See [Oracle's November 2026 security advisory](https://www.oracle.com/security-alerts/cspunov2026.html)
and the [Microsoft Build of OpenJDK update](https://devblogs.microsoft.com/java/java-openjdk-november-2026-critical-patch-update/)
for more information.

## What you should do

1. **Check the runtime used by your running application.** For example, log the
   `java.runtime.version` and `java.vendor` system properties from code running
   in the Java function. An installed Java binary or configured application
   setting alone does not confirm the runtime in use.
2. **Restart affected apps using a built-in runtime once the fixed runtime is
   available for your app**, then verify that the running Java worker uses a
   fixed build. Plan for a possible interruption and test changes before
   production deployment where possible.
3. **Update runtimes you manage.** For custom containers and bundled runtimes,
   obtain a fixed release from your vendor, then rebuild, test, and redeploy the
   application or image.
4. **Consider interim mitigations if you cannot update immediately.**
   [Microsoft's guidance](https://techcommunity.microsoft.com/blog/azurenetworksecurityblog/addressing-java4shell-cve-2026-114938-upgrade-guidance-and-azure-waf-mitigations/4574305)
   describes Azure Web Application Firewall mitigations for HTTP traffic.
   These do not replace patching and do not protect traffic that does not pass
   through the firewall.

## What the updates address

CVE-2026-114938 is an out-of-bounds memory write in the accelerated Base64
decoder of affected OpenJDK runtimes. Exploitation requires attacker-controlled
input to reach the affected decoding path on an x86-64 processor with AVX-512
VBMI support. Depending on the application and environment, the issue can
cause a crash or allow remote code execution.

For more information, see Datadog's
[Java4Shell security analysis](https://securitylabs.datadoghq.com/articles/java4shell-remote-code-execution-in-openjdk-cve-2026-114938/).
