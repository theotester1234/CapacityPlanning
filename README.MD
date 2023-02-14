#  Capacity Planning - Business Central ssss

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

- Clone/Download the [sample project](https://github.com/theotester1234/CapacityPlanning) to a selected location
- Open a the project with VS Code
- If not selected, please select the main branch
- Publish the project

## Insert Sample Data

- To get a package of sample data please download [this file](https://github.com/theotester1234/CapacityPlanning/raw/main/SampleData/PackageGETINSERTS.rapidstart)
- In Business Central open the page ***Configuration Packages*** (German: ***Konfigurationspakete***)
- Create a new entry
- Give it any Code and Package Name
- Import Package and choose the downloaded file
- Apply Package
