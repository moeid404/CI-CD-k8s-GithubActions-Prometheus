# AWS Infrastructure Setup with Terraform

This configuration sets up AWS resources for an agent and a Prometheus server using Terraform.

## Resources Overview

### 1. Security Groups

#### Agent Security Group (`agent_sg`)
- **Purpose**: Allow inbound traffic for the agent.
- **Ingress Rules**:
  - HTTP (port 80)
  - SSH (port 22)
  - Application (port 8080)
  - MySQL (port 3306)
  - Node Exporter (port 9100)
- **Egress Rule**: Allows all outbound traffic.

#### Prometheus Security Group (`prometheus_sg`)
- **Purpose**: Allow inbound traffic for the Prometheus server.
- **Ingress Rules**:
  - HTTP (port 80)
  - SSH (port 22)
  - Node Exporter (port 9100)
  - Application (port 8080)
  - Prometheus Web UI (port 9090)
  - Alertmanager (port 9093)
  - Grafana (port 3000)
- **Egress Rule**: Allows all outbound traffic.

### 2. EC2 Instances

#### Agent Instance
- **AMI**: `ami-0e86e20dae9224db8` (Ubuntu AMI)
- **Instance Type**: Specified by the `instance_type` variable (default: `t2.medium`)
- **Key Name**: Specified by the `ssh_key_name` variable
- **Security Group**: Attached to `agent_sg`

#### Prometheus Instance
- **AMI**: `ami-0e86e20dae9224db8` (Ubuntu AMI)
- **Instance Type**: Specified by the `instance_type` variable (default: `t2.medium`)
- **Key Name**: Specified by the `ssh_key_name` variable
- **Security Group**: Attached to `prometheus_sg`

### 3. Outputs
- `agent_public_ip`: The public IP address of the agent instance.
- `agent_private_ip`: The private IP address of the agent instance.
- `prometheus_public_ip`: The public IP address of the Prometheus server.

## Usage

1. Ensure you have Terraform installed and configured with your AWS credentials.
2. Modify the `provider` section to change the region if necessary.
3. Set the `instance_type` and `ssh_key_name` variables as needed.
4. Initialize Terraform:
   ```bash
   terraform init
   terraform plan
   terraform apply

