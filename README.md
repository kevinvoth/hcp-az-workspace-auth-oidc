# hcp-az-workspace-auth-oidc

## Purpose

This repository contains the Terraform configuration for an Azure environment used in an OIDC-based authentication flow with Terraform Cloud. The configuration provisions the Azure resource groups required for the workspace and connects the deployment to the remote Terraform Cloud backend for state management and automated execution.

## Scope

The code defines:

- the AzureRM provider and subscription context
- the Azure resource groups required for the workload
- the Terraform version and provider constraints
- the Terraform Cloud workspace configuration used for remote runs

## Resources

`provider.tf`
- Configures the `azurerm` provider
- Sets the Azure subscription ID used for deployment

`resource_group.tf`
- Creates:
  - `hcp-az-cac-workspace-auth-oidc` in `canadacentral`
  - `hcp-az-cae-workspace-auth-oidc` in `canadaeast`
- Applies environment metadata:
  - `environment = "uat"`
  - `servicetier = "nonprod"`

`terraform.tf`
- Requires Terraform `>= 1.17.0`
- Uses `hashicorp/azurerm` version `5.14.0`
- Configures the Terraform Cloud backend:
  - organization: `vothdev`
  - workspace: `hcp-az-workspace-auth-oidc`

## Automation

Workflow definitions under `.github/workflows/` are intended to automate Terraform operations through Terraform Cloud:

- `terraform-plan.yml.txt` performs speculative plan runs for pull requests
- `terraform-apply.yml.txt` triggers apply runs on pushes to `main`

This keeps infrastructure changes reviewable and deployable via CI/CD while using OIDC-driven authentication to Azure.

## Operational Notes

This directory is infrastructure-as-code only. It does not contain application code or runtime services; it exists to provision the Azure platform resources and support the secure automation pattern used by the Terraform Cloud workspace.