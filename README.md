# terraform_practice
This project is to deepen knowledge of Terraform

Created aliases to replace commands with docker:

`alias aws='docker run -it --rm  --env-file=$PWD/env_file_aws amazon/aws-cli'`

`alias terraform='docker run -it --rm --env-file=$PWD/env_file_aws -v $PWD:$PWD -w $PWD hashicorp/terraform'`

Created `env_file_aws` that looks like:
```
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=us-east-1
```