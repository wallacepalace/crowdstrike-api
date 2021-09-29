## Repositório de scripts API CrowdStrike - Wallace Alves

![image](https://user-images.githubusercontent.com/43219645/135185445-dd1ea5d3-2b8b-4b8d-942d-9a068dbc291c.png)

> How to install module: https://github.com/CrowdStrike/psfalcon/wiki/Installation

> Reference: https://github.com/CrowdStrike/psfalcon

Observation: 

## Overview

[PSFalcon](https://github.com/crowdstrike/psfalcon) is a [PowerShell Module](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_modules?view=powershell-7) that helps CrowdStrike
Falcon users interact with the CrowdStrike Falcon [OAuth2 APIs](https://assets.falcon.crowdstrike.com/support/api/swagger.html#/) without
having extensive knowledge of APIs or PowerShell. PSFalcon helps you automate tasks and perform actions outside of the
Falcon UI. For example, you could create scripts that:

* Modify large numbers of detections, incidents, policies or rules
* Utilize Real-time Response to perform an action on many devices at the same time
* Upload or download malware samples or Real-time Response files
* Create/modify configurations for MSSP parent and child environments

## Requirements
* An active Falcon subscription for the appropriate modules
* PowerShell 5.1+ (Windows), PowerShell 6+ (Linux/MacOS)
* A Falcon [OAuth2 API Client](https://falcon.crowdstrike.com/support/api-clients-and-keys) with appropriate roles

#### Visit the **[PSFalcon Wiki](https://github.com/CrowdStrike/psfalcon/wiki)** for information about [installation](https://github.com/CrowdStrike/psfalcon/wiki/Installation) and [commands](https://github.com/CrowdStrike/psfalcon/wiki/Commands).
