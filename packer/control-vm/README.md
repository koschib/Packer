# Azure Control-VM Image with Hashicorp Packer

To deploy a Control VM in Azure, we need a Linux image with appropriate devTools.
This image is generated with Hashicorp Packer and deployed in the appropriate resource group.



To create the image, Hashircorp packer must be installed.

automatic:

Mac:

`brew tap hashicorp/tap`

`brew install hashicorp/tap/packer`

`brew upgrade hashicorp/tap/packer`

Linux:

`curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -`

`sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"`

`sudo apt-get update && sudo apt-get install packer`


**Required variables**

Get your Azure subscription_id:

`az account show --query "{ subscription_id: id }"`

To create a "Contributor" role assignment:

`az ad sp create-for-rbac --role Contributor --scopes /subscriptions/<the subscribtion_id> --query "{ client_id: appId, client_secret: password, tenant_id: tenant }"
`

________________________


Set these environment variables:

client_id = ARM_CLIENT_ID

client_secret = ARM_CLIENT_SECRET

tenant_id = ARM_TENANT_ID

subscription_id = ARM_SUBSCRIPTION_ID

Example:

`export ARM_CLIENT_ID=<the client Id > `

To build an image with var file use:

 `packer build -var-file="variables.pkrvars.hcl" .  `








