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

## Progress
- [x] Define project structure with multi-environment support.
- [x] Create root files and folder structure.
- [ ] Next: Configure AWS provider and S3 backend.