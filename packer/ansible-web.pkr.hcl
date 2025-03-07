Complete the Packer("ansible-web.pkr.hcl) and Terraform("main.tf") configuration files. Look for the "#COMPLETE ME" comments.

Packer:
- add plugins for aws and ansible to packer block
- add configuration to the source block so that packer will:
    - use Ubuntu 24.04
    - in the "us-west-2" region
    - and an instance of type "t2.micro" for the source image
- add configuration to the build block so that packer will:
    - build an image named "packer-ansible-nginx" from the source
    - use an "ansible" provisioner to run the provided Ansible configuration.
        - Set the "user" using the included variables.pkr.hcl file
        - add an environment variable to set "ANSIBLE_HOST_KEY_CHECKING=False"


packer {
  required_plugins {
    # COMPLETE ME
    # add necessary plugins for ansible and aws
    ansible {
      version = ">= 1.1.2"
      source  = "github.com/hashicorp/ansible"
    }
    amazon = {
      version = ">= 1.3.4"
      source  = "github.com/hashicorp/amazon"
    }
}

source "amazon-ebs" "ubuntu" {
  # COMPLETE ME
  # add configuration to use Ubuntu 24.04 image as source image
}

build {
  # COMPLETE ME
  # add configuration to:
  # - use the source image specified above
  # - use the "ansible" provisioner to run the playbook in the ansible directory
  # - use the ssh user-name specified in the "variables.pkr.hcl" file
}
