# acit-4640-lab9

## Requirements

- AWS CLI
- Terraform installed
- Packer installed

### 1. Packer Setup

In the directory with the Packer configuration, run these commands to build the AMI:

```bash
packer init .
packer build ansible-web.pkr.hcl
```

### 2. Deploy with Terraform

In the directory with the Terraform configuration run:

```bash
terraform init
terraform plan
terraform apply
```

Type `yes` to apply the changes.

### 3. Access the EC2 Instance

When Terraform is finished, you can SSH into the EC2 instance using:

```bash
ssh -i /path/to/your/key.pem ubuntu@<EC2-Public-IP>
```

## Additional Information

- The AMI includes an Nginx installation.
