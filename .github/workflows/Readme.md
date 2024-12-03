# GitHub Actions Workflows: CI/CD Pipeline

This directory contains two GitHub Actions workflows: **CI Pipeline** and **CD Pipeline**, which together form a complete CI/CD pipeline for deploying and managing a Node.js application on Kubernetes with monitoring tools.

---

## Workflow Files

### 1. **CI Pipeline (`ci.yml`)**

**Purpose**: Automates the build, test, and Docker image creation processes for the Node.js application.

#### Key Steps:
1. **Checkout Code**: Fetches the latest code from the repository.
2. **Set up Node.js**: Configures Node.js environment with version 18.
3. **Install Dependencies**: Installs required Node.js modules.
4. **Run Unit Tests**: Executes unit tests using Jest.
5. **Validate Application**:
   - Starts the application.
   - Validates root, health check, and Prometheus metrics endpoints.
6. **Build and Push Docker Image**:
   - Builds a Docker image for the Node.js application.
   - Pushes the image to Docker Hub.

**Triggers**:
- On `push` to the `master` branch.
- Manual workflow dispatch.

---

### 2. **CD Pipeline (`cd.yml`)**

**Purpose**: Deploys the application and monitoring stack after the successful completion of the CI Pipeline.

#### Key Steps:
1. **Checkout Code**: Fetches the latest code.
2. **Configure AWS Credentials**: Sets up AWS credentials for Terraform.
3. **Set up Terraform**: Initializes Terraform for infrastructure provisioning.
4. **Provision Infrastructure**:
   - Applies Terraform to create infrastructure (e.g., EC2 instances).
   - Captures IPs of created instances for Ansible configuration.
5. **Update Ansible Inventory**:
   - Dynamically updates the `hosts.ini` file with instance IPs.
   - Updates `vars.yml` for agent and Prometheus servers.
6. **Run Ansible Playbooks**:
   - Configures the agent nodes and Prometheus server using Ansible.
7. **Rollback Deployment (on failure)**:
   - Destroys the infrastructure using Terraform if any step fails.

**Triggers**:
- After successful completion of the CI Pipeline.
- Manual workflow dispatch.

---

## Secrets Configuration

To use these workflows, set the following secrets in your GitHub repository:

| Secret Name             | Description                                      |
|-------------------------|--------------------------------------------------|
| `AWS_ACCESS_KEY_ID`     | AWS Access Key ID for Terraform and Ansible.     |
| `AWS_SECRET_ACCESS_KEY` | AWS Secret Access Key for Terraform and Ansible. |
| `DOCKER_USERNAME`       | Docker Hub username for pushing Docker images.   |
| `DOCKER_PASSWORD`       | Docker Hub password for authentication.          |
| `SSH_PRIVATE_KEY`       | Private SSH key to access the servers.           |

---

## Usage

1. **Set Up GitHub Secrets**:
   - Configure the above secrets in the GitHub repository.

2. **Push Code to Master**:
   - Pushing changes to the `master` branch triggers the **CI Pipeline**.

3. **Monitor Workflows**:
   - CI Pipeline runs first. If successful, it triggers the CD Pipeline.

4. **Manual Trigger**:
   - Both workflows support manual triggering via GitHub Actions.

---

## Pipeline Overview

### CI Pipeline
- Ensures code quality with automated testing.
- Creates and pushes a production-ready Docker image to Docker Hub.

### CD Pipeline
- Dynamically provisions infrastructure using Terraform.
- Configures servers with Ansible.
- Deploys the application in Kubernetes.
- Sets up monitoring with Prometheus, Grafana, and Alertmanager.

---

## Author

[Mohamed Eid](https://github.com/moeid404)
