Complete the Packer("ansible-web.pkr.hcl) and Terraform("main.tf") configuration files. Look for the "#COMPLETE ME" comments.



packer {
  required_plugins {
    ansible {
      version = ">= 1.1.2"
      source  = "github.com/hashicorp/ansible"
    }
    amazon = {
      version = ">= 1.3.4"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
    ami_filter {
    filters = {
      name = "ubuntu/images/hvm-ssd/ubuntu-focal-24.04-amd64-server-*"
    }
    owners = ["099720109477"]
    most_recent = true

    region        = "us-west-2"
    instance_type = "t2.micro"
    ssh_username  = var.ssh_username
    }
  }


build {
  # add configuration to:
  # - use the source image specified above
  name = "packer-ansible-nginx"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
  # - use the "ansible" provisioner to run the playbook in the ansible directory
        provisioner "ansible" {
            playbook_file = "ansible/playbook.yml"
            user = var.ssh_username
            environment_vars = [
                "ANSIBLE_HOST_KEY_CHECKING=False"
            ]

        }


}
