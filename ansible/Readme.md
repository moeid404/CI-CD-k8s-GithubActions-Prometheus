# Ansible Playbook: Agent and Monitoring Setup

This repository contains Ansible playbooks and roles to configure agent nodes and monitoring systems. The setup includes provisioning, configuring remote users, setting up Kubernetes, Prometheus, Grafana, Node Exporter, Alertmanager, and iptables.

## Directory Structure

```plaintext
.
├── agent_play.yml                 # Playbook for agent nodes
├── prometheus_play.yml            # Playbook for Prometheus monitoring
├── hosts.ini                      # Inventory file for target hosts
├── roles                          # Ansible roles directory
│   ├── 1.agent                    # Roles for agent node setup
│   │   ├── 1.provisioning         # Initial provisioning tasks
│   │   ├── 2.remote_user          # Remote user configuration
│   │   ├── 3.ssh_conf             # SSH configuration
│   │   ├── 4.k8s                  # Kubernetes setup
│   │   ├── 5.agent-node-exporter  # Node Exporter for agents
│   │   └── 6.iptables             # iptables configuration
│   └── 2.monitoring               # Roles for monitoring setup
│       ├── 1.provisioning         # Initial provisioning tasks
│       ├── 2.remote_user          # Remote user configuration
│       ├── 3.ssh_conf             # SSH configuration
│       ├── 4.prometheus           # Prometheus installation and setup
│       ├── 5.grafana              # Grafana installation and setup
│       ├── 6.node_exporter        # Node Exporter setup
│       ├── 7.alert_manager        # Alertmanager setup
│       └── 8.iptables             # iptables configuration
├── update_hosts.sh                # Script to update hosts file
└── vars.yml                       # Variables file for common configurations
```

## Playbooks

### `agent_play.yml`
- Configures agent nodes.
- Includes roles for provisioning, SSH configuration, Kubernetes, Node Exporter, and iptables.

### `prometheus_play.yml`
- Sets up the monitoring stack on the Prometheus server.
- Includes roles for provisioning, Prometheus, Grafana, Node Exporter, Alertmanager, and iptables.

## Variables

Variables are defined in `vars.yml`:

| Variable        | Description                           | Default Value |
|-----------------|---------------------------------------|---------------|
| `port`          | SSH port for remote connections      | `22`          |
| `user_name`     | Remote user name                     | `eid`         |
| `grafana_port`  | Port for Grafana                     | `3000`        |
| `grafana_protocol` | Protocol for Grafana (http/https) | `http`        |

## Inventory

The target hosts are defined in `hosts.ini`. Update it with the IPs or hostnames of your agent nodes and Prometheus server.

## Usage

1. **Install Dependencies**:
   Ensure Ansible is installed on your control node.

   ```bash
   sudo apt install ansible
   ```

2. **Configure Hosts**:
   Update `hosts.ini` with your target servers.

3. **Run the Playbooks**:
   - To configure agent nodes:
     ```bash
     ansible-playbook -i hosts.ini agent_play.yml --become
     ```
   - To set up monitoring:
     ```bash
     ansible-playbook -i hosts.ini prometheus_play.yml --become
     ```

4. **Verify Setup**:
   - For agents: Check Kubernetes and Node Exporter services.
   - For monitoring: Ensure Prometheus, Grafana, and Alertmanager are running.

## Notes

- Ensure `update_hosts.sh` is executed if you need to modify your hosts file dynamically.
- Customize roles and variables as needed for your environment.

## Author

[Mohamed Eid](https://github.com/moeid404)
