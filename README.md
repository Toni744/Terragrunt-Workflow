# Terragrunt workflow Project

This repository contains infrastructure as code (IaC) for deploying and managing cloud resources using Terraform and Terragrunt.

## Project Structure

```
.
├── .github/
│   └── workflows/         # GitHub Actions workflows
├── environments/          # Environment-specific configurations
│   ├── dev/               # Development environment
│   ├── staging/           # Staging environment
│   └── prod/              # Production environment
├── modules/               # Reusable Terraform modules
├── terragrunt.hcl         # Root Terragrunt configuration
└── README.md              # This file
```

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (v1.5.0 or newer)
- [Terragrunt](https://terragrunt.gruntwork.io/docs/getting-started/install/) (v0.45.0 or newer)
- [AWS CLI](https://aws.amazon.com/cli/) configured with appropriate credentials
- [GitHub Actions](https://github.com/features/actions) for CI/CD

## Getting Started

### Local Development

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/your-repo-name.git
   cd your-repo-name
   ```

2. Navigate to the environment you want to deploy:
   ```bash
   cd environments/dev
   ```

3. Initialize and apply Terragrunt:
   ```bash
   terragrunt init
   terragrunt plan
   terragrunt apply
   ```

### Configuration

Environment-specific variables are stored in each environment directory in `.tfvars` files or in the `terragrunt.hcl` files.

## Terragrunt Integration

This project uses Terragrunt to manage Terraform configurations across multiple environments and components. Key benefits:

- DRY (Don't Repeat Yourself) configurations
- Easy environment management
- Remote state management
- Dependencies between resources

## CI/CD with GitHub Actions

This repository includes GitHub Actions workflows for automated testing, validation, and deployment:

- **Terraform Validation**: Runs `terraform validate` and `terraform fmt` checks on pull requests
- **Infrastructure Deployment**: Automatically applies infrastructure changes to environments based on branch

## Modules

The project contains several reusable Terraform modules:

- **networking**: VPC, subnets, route tables, etc.
- **compute**: EC2 instances, Auto Scaling Groups
- **database**: RDS databases
- **security**: Security groups, IAM roles

## Best Practices

- Always use Terragrunt for applying changes
- Run `terragrunt plan` before applying to review changes
- Never store sensitive information in the repository
- Use remote state with locking
- Tag all resources appropriately

## Troubleshooting

### Common Issues

- **State Lock Issues**: If a state lock error occurs, verify no other deployments are running and consider using `terragrunt force-unlock` if needed
- **Credential Problems**: Ensure AWS credentials are properly configured
- **Dependency Errors**: Check the dependency order in Terragrunt configurations

## Contributing

1. Create a feature branch from `main`
2. Make your changes
3. Submit a pull request
4. Ensure GitHub Actions checks pass

## License

This project is licensed under the MIT License - see the LICENSE file for details.
