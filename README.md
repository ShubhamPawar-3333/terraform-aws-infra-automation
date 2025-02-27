# Terraform AWS Infrastructure Hands-On

This project provisions a multi-environment AWS infrastructure (VPC, subnets, NAT Gateway, Bastion host) using Terraform, automated with GitHub Actions, duplicating a real-world setup, and tears it down after testing.

## Prerequisites
- AWS account with IAM credentials (Access Key and Secret Key).
- Terraform installed locally.
- GitHub repository for CI/CD.

## Final Project Structure
```text
terraform-aws-infra/
├── .github/
│   └── workflows/
│       └── terraform.yml       # GitHub Actions workflow for CI/CD across envs
├── modules/
│   ├── vpc/                   # VPC and networking module
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── bastion/               # Bastion host module
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── env/
│   ├── dev/                   # Dev environment config
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── terraform.tfvars
│   ├── staging/               # Staging environment config
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── terraform.tfvars
│   └── prod/                  # Prod environment config
│       ├── main.tf
│       ├── variables.tf
│       └── terraform.tfvars
├── main.tf                    # Root config (S3 backend, provider)
├── variables.tf               # Global variables
├── outputs.tf                 # Global outputs
├── provider.tf                # AWS provider config
├── .gitignore                 # Ignored files
└── README.md                  # Project documentation
```

## Steps to Build
1. Set up root files and folder structure.
2. Configure AWS provider and S3 backend.
3. Create VPC module with subnets and NAT Gateway.
4. Create Bastion module for EC2 instance.
5. Set up multi-environment configs (dev, staging, prod).
6. Configure GitHub Actions for automation across environments.
7. Test creation and deletion (focus on dev for hands-on).

## Setup Instructions
1. **AWS Credentials**: Configure AWS CLI with `aws configure` or set environment variables.
2. **S3 Backend**: Create an S3 bucket (`my-terraform-state-bucket`) and DynamoDB table (`terraform-locks`) in `us-east-1`.
3. **Terraform Config**: Provider and backend are set in `provider.tf` and `main.tf`.
4. **Initialize**: Run `terraform init` to set up the backend and provider.
5. **VPC Module**: Defined in `modules/vpc/` with VPC, public/private subnets, IGW, NAT Gateway, and route tables.
6. **Bastion Module**: Defined in `modules/bastion/` with an EC2 instance in the public subnet for SSH access.
7. **Dev Environment**: Configured in `env/dev/` to call VPC and Bastion modules with dev-specific settings.
8. **Test Bastion**: SSH into the Bastion with `ssh -i bastion-key.pem ec2-user@<public-ip>`.
9. **GitHub Actions**: Workflow in `.github/workflows/terraform.yml` automates Terraform for dev.

## Progress
- [x] Define project structure with multi-environment support.
- [x] Create root files and folder structure.
- [x] Configure AWS provider and S3 backend.
- [x] Create VPC module with subnets and NAT Gateway.
- [x] Create Bastion module for EC2 instance.
- [x] Set up multi-environment configs (dev, staging, prod) - dev complete.
- [x] Configure GitHub Actions for automation across environments - dev automated.
- [ ] Next: Extend to staging/prod and cleanup.