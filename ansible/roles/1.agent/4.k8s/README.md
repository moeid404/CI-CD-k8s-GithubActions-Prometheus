# Ansible Playbook: Docker and Kubernetes Setup

This playbook automates the setup of Docker, Docker Compose, and a local Kubernetes cluster using Kind.

## Features

### Docker Installation
- Installs Docker and Docker Compose.
- Configures Docker for non-root usage.

### Kubernetes Installation
- Installs `kubectl` and Kind.
- Creates a Kind cluster with an Ingress Controller.
- Deploys Kubernetes manifests for your application.

## Usage

1. **Clone the Repository**
   ```bash
   git clone https://github.com/your-repo/docker-k8s-setup.git
   cd docker-k8s-setup
   ```

2. **Run the Playbook**
   ```bash
   ansible-playbook -i inventory site.yml --become
   ```

3. **Verify Installations**
   - Docker:
     ```bash
     docker --version
     docker-compose --version
     ```
   - Kubernetes:
     ```bash
     kubectl get nodes
     ```

## Notes
- Kubernetes manifests are copied to `/opt/k8s-manifests` on the target server.
- Ensure the target server is Ubuntu-based and supports Ansible.

## Author

[Mohamed Eid](https://github.com/moeid404)
