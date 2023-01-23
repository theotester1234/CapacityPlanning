#  Capacity Planning - Business Central

This is the Business Central app about the Capacity Planning authored by Theo Heußner.

## Prerequisites

In order to get this Capacity Planning started on your machine, you will need:

- Business Central (I recommend using [Docker](https://docs.docker.com/get-docker/) and [BCContainerHelper](https://github.com/microsoft/navcontainerhelper))

```PowerShell
    Register-PSRepository -Default

    Install-Module -Name BCContainerHelper
    
    Set-ExecutionPolicy Bypass -Scope Process -Force
  
    Import-Module BCContainerHelper

    New-BcContainer `
        -isolation process `
        -accept_eula `
        -containerName CapaPlanning `
        -artifactUrl (Get-BCArtifactUrl -version 20 -type OnPrem -country de -select Latest) `
        -auth Windows `
        -updateHosts `
        -additionalParameters @('-e CustomNavSettings=ServicesUseNTLMAuthentication=true')

```

- [git version control](https://git-scm.com/)
- [VS Code](https://code.visualstudio.com/) and the [AL Language Extension](https://marketplace.visualstudio.com/items?itemName=ms-dynamics-smb.al)

## Start the project

- Clone/Download the [sample project](https://dev.azure.com/TheoHeussner/Kapazit%C3%A4tsplanung) to a selected location
- Open a the project with VS Code
- If not selected, please select the master branch
- Publish the project

## Insert Sample Data

- To get a package of sample data please download [this file](https://dev.azure.com/TheoHeussner/eb1f6a4a-9ee4-4c8c-9dae-69e7df7332bf/_apis/git/repositories/2b3888dc-fe96-486c-80a3-e338c72d4871/items?path=/SampleData/PackageGETINSERTS.rapidstart&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=octetStream&api-version=5.0&download=true)
- In Business Central open the page ***Configuration Packages*** (German: ***Konfigurationspakete***)
- Create a new entry
- Give it any Code and Package Name
- Import Package and choose the downloaded file
- Apply Package