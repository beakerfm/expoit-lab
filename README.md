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


## Deploy
Run 

* `terraform init`
* `terraform plan`
* `terrform apply`

to destroy the environment run `terraform destroy`.

This will deploy a single Centos 7 host in Digital Ocean with a random vulnerable image
from [vulhub](https://github.com/vulhub/vulhub)

You can login to the vulnerable host at the IP specfied for the newly created VM, using
the SSH key generated and `root` user.

WARNING: this VM is about as vulnerable as it gets! Be safe and don't reuse important keys!
