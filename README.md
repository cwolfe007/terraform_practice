# terraform_practice
This project is to deepen knowledge of Terraform

Created aliases to replace commands with docker:
`alias aws='docker run -it --env-file=$PWD/env_file_aws amazon/aws-cli'`
`alias terraform='docker run -it --env-file=$PWD/env_file_aws -v $PWD:$PWD -w $PWD hashicorp/terraform'`