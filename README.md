# Exploit Lab

A simple lab setup to test vulnerable docker containers.
A random vulnerable server will be spun up on a Digital Ocean Instance.
Terraform is used to deploy the machine and vulnerable Docker image.
This way it can easily be deleted and redeployed.

## Prerequisites

* Install [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
* Generate Digital Ocean API key
* Create SSH Key (`ssh-keygen`)

Add the details to your `.bash_profile` as environment variables

```
export TF_VAR_DO="<DO_API_KEY>"
export TF_VAR_PRIVATE="<path_to_key>/id_rsa"
export TF_VAR_PUBLIC="<path_to_key>/id_rsa.pub"
```

Note you should match the key names to the ones you created.


## 
