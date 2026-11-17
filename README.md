# Terraform AWS Lab Assessment
 
Provisions AWS infrastructure with Terraform: VPC, subnets, route tables,
Internet Gateway, EC2 instance, S3 bucket and CloudFront distribution.
 
## Architecture
 
- VPC `10.0.0.0/16`
- Public subnet `10.0.1.0/24` (route to Internet Gateway) with an Ubuntu 24.04 EC2 instance
- Private subnet `10.0.2.0/24` (no internet route)
- Private S3 bucket (versioning, encryption, public access blocked)
- CloudFront distribution reading the bucket through Origin Access Control
 
## Prerequisites
 
- Terraform >= 1.5
- AWS CLI configured (`aws configure`) with an IAM user that can create these resources
- Region: `ap-southeast-2`
 
## Files
 
| File | Purpose |
|------|---------|
| provider.tf | AWS provider and default tags |
| main.tf | All resources |
| variables.tf | Input variables |
| terraform.tfvars | Variable values |
| outputs.tf | Output values |
 
## Usage
 
```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy   # clean up when finished
```
 
## Outputs
 
VPC ID, subnet IDs, Internet Gateway ID, EC2 instance ID and public IP,
S3 bucket name, CloudFront domain name.
 
## Best practices used
 
- Variables instead of hardcoded values, with descriptions and types
- Tags on every resource, plus provider `default_tags`
- Provider version pinned
- S3 bucket private, accessed only through CloudFront (OAC)
- SSH restricted to a single IP, not `0.0.0.0/0`
- No credentials stored in the code
- State files excluded with `.gitignore`
 
## Troubleshooting
 
 **Service control policy deny** (`UnauthorizedOperation`, `p-h8wwbub2`):
1. EC2 and S3 calls were denied in `ap-south-1` and `us-east-1`. Diagnosed from the
   error message (explicit deny in an organization SCP), tested several services and
   regions, and resolved by using the allowed region `ap-southeast-2`.
2. **Unsupported block type** in `main.tf`: caused by a missing closing brace in the VPC
   block. Fixed by correcting the braces and re-running `terraform validate`.
3. **Invalid CIDR block** for the SSH rule: the IP was missing the `/32` suffix.
   Fixed by changing it to `x.x.x.x/32`.
