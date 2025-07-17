# Aviatrix AWS CloudShell Launcher - Quick Reference

## Basic Commands

```bash
# Interactive deployment (recommended for first-time users)
./deploy-aviatrix-controlplane.sh

# Automated deployment
./deploy-aviatrix-controlplane.sh -n "my-avx" -r "us-east-1" -e "admin@company.com" -p "Secure123!" -c "aviatrix-abc-123456"

# Include CoPilot analytics
./deploy-aviatrix-controlplane.sh -n "my-avx" -C

# Test configuration without deploying
./deploy-aviatrix-controlplane.sh -t

# Plan deployment (see what will be created)
./deploy-aviatrix-controlplane.sh -a plan

# Destroy deployment
./deploy-aviatrix-controlplane.sh -a destroy -n "my-avx"
```

## Parameter Reference

| Short | Long | Description | Example |
|-------|------|-------------|---------|
| `-n` | `--deployment-name` | Unique deployment name | `-n "prod-avx"` |
| `-r` | `--region` | AWS region | `-r "us-east-1"` |
| `-e` | `--admin-email` | Admin email | `-e "admin@company.com"` |
| `-p` | `--admin-password` | Admin password | `-p "Secure123!"` |
| `-c` | `--customer-id` | Aviatrix license ID | `-c "aviatrix-abc-123456"` |
| `-C` | `--include-copilot` | Deploy CoPilot | `-C` |
| `-i` | `--incoming-cidrs` | Your public IP/CIDR | `-i "203.0.113.25/32"` |
| `-m` | `--mgmt-ips` | Additional mgmt IPs | `-m "192.168.1.0/24"` |
| `-y` | `--skip-confirmation` | Skip prompts | `-y` |
| `-a` | `--action` | Terraform action | `-a plan` |
| `-t` | `--test-mode` | Validate only | `-t` |
| `-h` | `--help` | Show help | `-h` |

## Common Workflows

### First-Time Deployment
1. `./deploy-aviatrix-controlplane.sh` (interactive)
2. Follow prompts for configuration
3. Wait 10-15 minutes for completion
4. Access controller at provided URL

### Production Deployment
1. `./deploy-aviatrix-controlplane.sh -a plan [params]` (review)
2. `./deploy-aviatrix-controlplane.sh [params]` (deploy)
3. Document access URLs and credentials

### Troubleshooting Deployment
1. `./deploy-aviatrix-controlplane.sh -t [params]` (validate)
2. Check AWS CLI: `aws sts get-caller-identity`
3. Verify permissions and region support
4. Review logs in `./aviatrix-deployment/`

### Clean Up
1. `./deploy-aviatrix-controlplane.sh -a destroy -n "deployment-name"`
2. Confirm destruction when prompted
3. Verify cleanup in AWS console

## Prerequisites Checklist

- [ ] AWS CloudShell access or local AWS CLI
- [ ] AWS authentication configured
- [ ] IAM permissions (EC2, IAM, CloudFormation)
- [ ] Valid Aviatrix customer license ID
- [ ] Admin email address
- [ ] Secure password (8+ chars, letter+number+symbol)

## Supported Regions

**US:** us-east-1, us-east-2, us-west-1, us-west-2  
**Canada:** ca-central-1, ca-west-1  
**South America:** sa-east-1  
**Europe:** eu-central-1, eu-central-2, eu-west-1, eu-west-2, eu-west-3, eu-north-1, eu-south-1, eu-south-2  
**Asia Pacific:** ap-east-1, ap-south-1, ap-south-2, ap-southeast-1, ap-southeast-2, ap-southeast-3, ap-southeast-4, ap-northeast-1, ap-northeast-2, ap-northeast-3  
**Middle East & Africa:** me-south-1, me-central-1, af-south-1

## Output Information

After deployment:
- **Controller URL:** `https://[controller-ip]`
- **CoPilot URL:** `https://[copilot-ip]` (if deployed)
- **Username:** `admin`
- **Password:** [your specified password]

## Quick Troubleshooting

| Issue | Solution |
|-------|----------|
| "AWS CLI not authenticated" | `aws configure` or `aws sso login` |
| "Permission denied" | Check IAM permissions |
| "Region not supported" | Use supported region |
| "Invalid customer ID" | Check format: `aviatrix-abc-123456` |
| "Password validation failed" | Meet requirements: 8+ chars, letter+number+symbol |
| "Deployment timeout" | Check AWS service health |

## File Locations

- **Script:** `./deploy-aviatrix-controlplane.sh`
- **Terraform files:** `./aviatrix-deployment/`
- **Logs:** `./aviatrix-deployment/terraform.log`

## Getting Help

- **Script help:** `./deploy-aviatrix-controlplane.sh -h`
- **Aviatrix docs:** https://docs.aviatrix.com
- **Support:** https://support.aviatrix.com
- **AWS CloudShell:** https://docs.aws.amazon.com/cloudshell/
