#!/bin/bash

#
# Example: One-liner deployment with all parameters
# This example shows how to deploy Aviatrix with minimal interaction
#

# Download and execute the deployment script with all parameters
curl -s https://raw.githubusercontent.com/your-repo/aws-cloudshell-launcher/deploy-aviatrix-controlplane.sh | bash -s -- \
  --deployment-name "quick-deploy-demo" \
  --region "us-east-1" \
  --admin-email "admin@mycompany.com" \
  --admin-password "MyVerySecure123!" \
  --customer-id "aviatrix-abc-123456" \
  --include-copilot \
  --skip-confirmation

# Alternative: Download first, then run
# curl -O https://raw.githubusercontent.com/your-repo/aws-cloudshell-launcher/deploy-aviatrix-controlplane.sh
# chmod +x deploy-aviatrix-controlplane.sh
# ./deploy-aviatrix-controlplane.sh --deployment-name "quick-deploy" --region "us-east-1" --admin-email "admin@company.com" --admin-password "Secure123!" --customer-id "aviatrix-abc-123456" --skip-confirmation
