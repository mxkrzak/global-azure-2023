$studentprefix ="mpo"
$resourcegroupName = "fabmedical-rg-" + $studentprefix

[string]$id = $(az group show `
    --name $resourcegroupName `
    --query id)

az ad sp create-for-rbac `
    --name "fabmedical-$studentprefix" `
    --sdk-auth `
    --role contributor `
    --scopes '/subscriptions/808dedb1-e3a3-4fc9-9e4d-b08ade828e2d/resourceGroups/fabmedical-rg-mpo' # copy/paste value from $id and to scope
                                    # here is issue in powershell / cli variable becauseaz group show returning in 'id'