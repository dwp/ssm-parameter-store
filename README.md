# ssm-parameter-store
We want to be able to version control, and review private (and potentially secret) data. e.g. the private data stored in SSM's parameter store.  

This repo is a test using [git-secret](https://git-secret.io) and some identically formatted sample data, in order to achieve this.  The data is encrypted, using a keyring containing the current team members public keys.  This currently allows these members (`git secret whoknows`) to decrypt, edit, and encrypt the data we intend to be private(secret).


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