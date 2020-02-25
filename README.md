# ssm-parameter-store
Private data stored in SSM's parameter store


# Required

`git-secret` which can be obtained by:  
`brew install git-secret`  

You can unseal the secrets with:  
`git secret reveal`  

You can make changes and then reseal with:  
`git secret hide -d`  

the `-d` deletes the plain text version of the file you edited.

