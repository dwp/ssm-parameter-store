# ssm-parameter-store
Private data stored in SSM's parameter store


## Required

`git-secret` which can be obtained by:  
`brew install git-secret`  

You can unseal the secrets with:  
`git secret reveal`  

You can make changes and then reseal with:  
`git secret hide -d`  

the `-d` deletes the plain text version of the file you edited.

## Secret-Builder
Locally built & ran Docker container, that improves the usage of this format for some users.  

### Usage

```
docker build -t dwpdigital/secret-builder:0.0.1 .
```  

```
docker run -it -v ~/.ssh/id_rsa:/root/.ssh/id_rsa -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub -v ~/.gnupg/:/root/.gnupg -e GIT_USERNAME='Your Name' -e GIT_EMAIL=your.name@email.com dwpdigital/secret-builder:0.0.2
```  

```
git clone git@github.com:dwp/ssm-parameter-store.git
cd ssm-parameter-store
```  

`reveal` and `hide` commands will work as above.