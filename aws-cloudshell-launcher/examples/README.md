# AWS CloudShell Launcher Examples

This directory contains example scripts and usage patterns for the Aviatrix AWS deployment script.

## Examples Included

### one-liner-example.sh
Demonstrates how to download and execute the deployment script with all parameters in a single command, suitable for automation or CI/CD pipelines.

## Usage Patterns

### 1. Interactive Development/Testing
```bash
# Run with minimal parameters, let the script prompt for the rest
./deploy-aviatrix-controlplane.sh --deployment-name "test-env" --region "us-east-1"
```

### 2. Production Automation
```bash
# Fully automated deployment with all parameters
./deploy-aviatrix-controlplane.sh \
  --deployment-name "prod-avx-primary" \
  --region "us-east-1" \
  --admin-email "aviatrix-admin@company.com" \
  --admin-password "${AVIATRIX_PASSWORD}" \
  --customer-id "${AVIATRIX_CUSTOMER_ID}" \
  --include-copilot \
  --mgmt-ips "10.0.0.0/8,192.168.0.0/16" \
  --skip-confirmation
```

### 3. Multi-Region Deployment
```bash
# Deploy controller in primary region
./deploy-aviatrix-controlplane.sh \
  --deployment-name "avx-us-east" \
  --region "us-east-1" \
  --admin-email "admin@company.com" \
  --admin-password "Secure123!" \
  --customer-id "aviatrix-abc-123456"

# Deploy additional controllers in other regions if needed
# (Note: typically you only need one controller per organization)
```

### 4. Test and Validate Before Deploy
```bash
# Test mode - validate configuration without creating resources
./deploy-aviatrix-controlplane.sh \
  --test-mode \
  --deployment-name "validation-test" \
  --region "us-west-2"
```

### 5. Planning Resources
```bash
# See what will be created before applying
./deploy-aviatrix-controlplane.sh \
  --action plan \
  --deployment-name "my-deployment" \
  --region "us-east-1"
```

### 6. Clean Up / Destroy
```bash
# Remove all deployed resources
./deploy-aviatrix-controlplane.sh \
  --action destroy \
  --deployment-name "my-deployment"
```

## Environment Variables

You can use environment variables for sensitive information:

```bash
# Set environment variables (e.g., in CI/CD)
export AVIATRIX_ADMIN_PASSWORD="MySecurePassword123!"
export AVIATRIX_CUSTOMER_ID="aviatrix-abc-123456"

# Use in script
./deploy-aviatrix-controlplane.sh \
  --deployment-name "env-deploy" \
  --region "us-east-1" \
  --admin-email "admin@company.com" \
  --admin-password "$AVIATRIX_ADMIN_PASSWORD" \
  --customer-id "$AVIATRIX_CUSTOMER_ID"
```

## Error Handling

All example scripts include basic error handling:

```bash
#!/bin/bash
set -euo pipefail  # Exit on error, undefined vars, pipe failures

# Your deployment commands here
if ./deploy-aviatrix-controlplane.sh [options]; then
    echo "Deployment successful!"
    # Post-deployment actions
else
    echo "Deployment failed!"
    # Cleanup or notification actions
    exit 1
fi
```

## Best Practices

1. **Use test mode first** to validate your configuration
2. **Store sensitive values securely** (environment variables, parameter store, etc.)
3. **Use descriptive deployment names** that indicate purpose/environment
4. **Plan before apply** in production environments
5. **Keep deployment scripts in version control**
6. **Document your specific parameter choices** for your organization
