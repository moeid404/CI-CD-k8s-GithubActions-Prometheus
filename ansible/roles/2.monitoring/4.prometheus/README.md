# Ansible Task: Prometheus Setup

This task automates the installation and configuration of Prometheus on the target server.

## Tasks

1. **Copy Installation Script**: Transfers the `install_prometheus.sh` script to `/tmp` on the target server and makes it executable.
2. **Run Installation Script**: Executes the script to install Prometheus.
3. **Copy Prometheus Configuration**:
   - Copies a `prometheus.yml` configuration file from a template to `/etc/prometheus/`.
   - Transfers `rules.yml` to `/etc/prometheus/`.
4. **Restart Prometheus Service**: Restarts and enables the Prometheus service.

## Usage

1. Place the following files in the appropriate directories:
   - `install_prometheus.sh` in the playbook directory.
   - `templates/prometheus.yml.j2` in the `templates` folder.
   - `rules.yml` in the playbook directory.
2. Run the playbook:
   ```bash
   ansible-playbook -i inventory prometheus.yml --become
   ```

## Notes
- Ensure the `install_prometheus.sh` script installs Prometheus correctly for your environment.
- Customize `prometheus.yml.j2` as needed for your monitoring setup.
- Verify Prometheus service status:
  ```bash
  systemctl status prometheus
  ```
- Configuration files are placed in `/etc/prometheus/` with appropriate ownership and permissions.

## Author

[Your Name](https://github.com/moeid404)
