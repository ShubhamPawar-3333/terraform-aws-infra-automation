# Terraform AWS Multi-Environment Infrastructure

This project automates the provisioning and management of a scalable AWS infrastructure across `dev`, `staging`, and `prod` environments using **Terraform** for Infrastructure as Code (IaC) and **GitHub Actions** for CI/CD automation. It features a VPC, public/private subnets, a Bastion Host for secure access, and state management, designed to demonstrate DevOps best practices while maintaining cost-efficiency (~₹10-12 for a 2-hour run).

---

## Tech Stack
- **Terraform**: For provisioning and managing AWS infrastructure.
- **GitHub Actions**: For automating CI/CD pipelines (currently inactive, steps commented out for safety).
- **AWS Services**: VPC, EC2 (Bastion Host), Subnets, Internet Gateway, NAT Gateway, S3 (state backend), DynamoDB (state locking), IAM (policies/secrets).
- **Shell Scripts**: Optional for custom configurations (e.g., Bastion setup).

---

## Architecture Diagram
![AWS Infrastructure Diagram](doc/terraform-aws-infra-automation.png)  
A visual representation of the VPC, subnets, Bastion Host, and traffic flows is included to illustrate the multi-environment setup.

---

## Environments
- **Dev, Staging, Production**: Each environment is isolated with its own VPC, using unique CIDR blocks (e.g., `10.0.0.0/16` for `dev`, `10.1.0.0/16` for `staging`, `10.2.0.0/16` for `prod`) to prevent overlap and ensure scalability.
- **Structure**: Configured in `env/dev/`, `env/staging/`, and `env/prod/` directories, calling reusable Terraform modules for consistency and isolation.

---

## CI/CD Workflow
The GitHub Actions pipeline (defined in `.github/workflows/terraform.yml`, but with Terraform steps currently commented out for safety) automates infrastructure management:
- **Trigger**: Push or pull request to `main`.
- **Steps** (Commented Out for Safety):
  1. Checkout code.
  2. Set up Terraform (v1.5.0).
  3. Run `terraform init` (commented out).
  4. Validate code with `terraform fmt -check` (commented out).
  5. Generate a plan with `terraform plan` (commented out).
  6. Apply changes for `dev` only (commented out, manual approval for `staging`/`prod` suggested).
- **Matrix**: Supports `dev`, `staging`, `prod` environments concurrently.
- **Note**: The workflow can be reactivated by uncommenting the steps when needed for testing or demonstration.

---

## Infrastructure as Code (IaC)
- **Terraform Modules**: Reusable `vpc` and `bastion` modules in `modules/` for VPC, subnets, gateways, and Bastion Host, promoting DRY (Don’t Repeat Yourself) principles.
- **State Management**: Uses an S3 bucket (`my-terraform-state-bucket`) and DynamoDB table (`terraform-locks`) for secure, collaborative state storage and locking.
- **Best Practices**: Version constraints (`required_providers`), modular design, variable validation, and clear documentation.

---

## How to Replicate
Follow these steps to set up and test the `dev` environment locally:

### 1. Clone the repository:
```bash
git clone https://github.com/<your-username>/terraform-aws-infra.git
cd terraform-aws-infra
```

### 2. Configure your environment:
- Install Terraform (v1.5.0+).
- Configure AWS CLI: `aws configure` with your IAM credentials.
- Create an S3 bucket (`my-terraform-state-bucket`) and DynamoDB table (`terraform-locks`) in `us-east-1`.
- Update `env/dev/terraform.tfvars` with your settings:
```hcl
aws_region         = "us-east-1"
vpc_cidr           = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"
key_name           = "bastion-key"  # Your AWS SSH key pair
```
### 3. Initialize and deploy:
```bash
cd env/dev
terraform init
terraform plan
terraform apply
```
### 4. Test the Bastion Host:
- SSH into the Bastion: `ssh -i bastion-key.pem ec2-user@<bastion-public-ip>` (replace with the IP from `terraform apply` output).

### 4. Clean up to avoid costs:
```bash
terraform destroy
```
Verify no AWS resources remain in the console.

## Security & Compliance:
- **IAM Policies**: Used AWS credentials as a service account for Terraform/GitHub Actions, with least-privilege principles (e.g., limited to VPC, EC2, S3, DynamoDB).
- **Secrets Management**: Stored AWS credentials in GitHub Secrets for secure CI/CD (when active).
- **Security Measures**: Bastion Host in public subnet with SSH-only access (port 22), private subnet isolation via NAT Gateway, and S3/DynamoDB encryption for state.


## Best Practices Implemented
- **DRY**: Reusable Terraform modules reduce code duplication.
- **Linting & Validation**: terraform fmt -check and terraform validate ensure code quality (historically part of the workflow).
- **Efficiency**: Quick deploy/destroy cycles minimize costs (~₹10-12/2hrs).
- **Documentation**: Clear README.md, modular structure, and diagram for transparency.

## Potential Improvements
- **Reactivate Workflow**: Uncomment GitHub Actions steps for testing, adding approval gates for staging/prod.
- **Separate Branches**: Use dev-branch, staging-branch, prod-branch for environment-specific deployments.
- **Monitoring**: Integrate AWS CloudWatch for resource metrics and alerts.
- **Scalability**: Add auto-scaling groups or load balancers for production-grade infra.


---

### Notes
- **Placeholder**: Replace `<your-username>` with your GitHub username.
- **Diagram**: Assumes `docs/terraform-aws-infra-automation.png` exists (from our Draw.io work). Ensure it’s in your repo and linked correctly.
- **Workflow Status**: Reflects that `.github/workflows/terraform.yml` exists but has Terraform steps commented out, maintaining historical accuracy for your portfolio.
- **Conciseness**: Kept under 200 lines, focused on key points, and formatted with Markdown (headings, bullets, code blocks).

---
