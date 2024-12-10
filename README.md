# Node.js CI/CD Pipeline on AWS with EKS

## Project Overview

This project demonstrates a comprehensive Continuous Integration and Continuous Deployment (CI/CD) pipeline for a Node.js application using AWS services and GitHub. The workflow includes building a Docker image, running tests on pull requests, deploying to an EKS cluster, and enabling notifications via SNS.

### Key Features

- **Node.js Application**: Simple Express app with Docker containerization
- **AWS CodeBuild**: Builds and pushes Docker image to ECR
- **AWS CodeDeploy**: Deploys containerized app to Amazon EKS cluster
- **GitHub Actions**: Automated testing on pull requests
- **AWS SNS**: Deployment notifications

## Folder Structure

```
.
├── index.js             # Main Node.js application file
├── package.json         # Node.js dependencies and scripts
├── Dockerfile           # Docker configuration
├── buildspec.yml        # AWS CodeBuild configuration
├── appspec.yml          # AWS CodeDeploy configuration for EKS
├── test/                # Jest test directory
│   └── app.test.js
└── .github/
    └── workflows/
        └── test.yml     # GitHub Actions workflow
```

## Prerequisites

Before setting up the pipeline, ensure you have:

- AWS CLI configured with appropriate permissions
- ECR Repository for Docker images
- EKS Cluster ready for deployments
- GitHub Repository with Actions enabled
- AWS SNS Topic for notifications

## Local Development

### Install Dependencies

```bash
npm install
```

### Run the Application

```bash
npm start
```

### Run Tests

```bash
npm test
```

## CI/CD Workflow

### Pull Request Stage
- GitHub Actions run `npm test` to validate code changes

### Build Stage (AWS CodeBuild)
- Docker image is built and pushed to Amazon ECR
- Image definition prepared for CodeDeploy

### Deploy Stage (AWS CodeDeploy)
- Docker image deployed to Amazon EKS cluster

### Notifications
- AWS SNS sends notifications for build/deployment status

## Configuration Files

### Dockerfile
Defines the Docker image build process for the Node.js application.

### buildspec.yml
Configures AWS CodeBuild to:
- Authenticate with Amazon ECR
- Build Docker image
- Push image to ECR repository
- Generate deployment artifacts

### appspec.yml
Specifies EKS deployment configuration, including:
- Container details
- Port mappings
- Deployment targets

### .github/workflows/test.yml
GitHub Actions workflow for:
- Checking out code
- Setting up Node.js
- Installing dependencies
- Running tests on pull requests

## AWS Services Used

- **Amazon ECR**: Container image storage
- **Amazon EKS**: Kubernetes cluster for deployment
- **AWS CodeBuild**: Continuous integration
- **AWS CodeDeploy**: Continuous deployment
- **AWS SNS**: Notification service

## Notification Setup

1. Create an SNS Topic in AWS Console
2. Subscribe email or Slack webhook
3. Configure CloudWatch Events to monitor CodeBuild and CodeDeploy

