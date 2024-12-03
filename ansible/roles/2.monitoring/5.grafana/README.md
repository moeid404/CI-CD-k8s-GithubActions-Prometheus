# Ansible Task: Grafana Setup

This task automates the installation and configuration of Grafana on the target server.

## Tasks

1. **Install Required Packages**: Installs essential dependencies such as `apt-transport-https`, `software-properties-common`, and `wget`.
2. **Set Up APT Keyrings**:
   - Creates necessary directories for keyrings and APT sources.
   - Downloads and adds the Grafana GPG key.
3. **Add Grafana Repository**: Configures the Grafana APT repository.
4. **Install Grafana**: Installs the latest version of Grafana.
5. **Configure Grafana**:
   - Updates `grafana.ini` to set the protocol and port.
6. **Restart Grafana Service**: Restarts and ensures the Grafana service is enabled.

## Variables

| Variable           | Description                  | Default Value |
|--------------------|------------------------------|---------------|
| `grafana_protocol` | Protocol for Grafana access  | `http`        |
| `grafana_port`     | Port for Grafana web service | `3000`        |

## Usage

1. Define variables `grafana_protocol` and `grafana_port` in your playbook or inventory.
2. Run the playbook:
   ```bash
   ansible-playbook -i inventory grafana.yml --become
   ```

## Notes

- The Grafana GPG key and repository are configured for secure installation.
- Configuration changes in `/etc/grafana/grafana.ini` allow customization of protocol and port.
- Verify Grafana service status:
  ```bash
  systemctl status grafana-server
  ```
- Grafana runs on port 3000 by default.

## Author

[Mohamed Eid](https://github.com/moeid404)
