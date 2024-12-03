# Ansible Task: Alertmanager Setup

This task sets up Alertmanager for Prometheus by creating necessary directories, copying configuration and installation scripts, and restarting Prometheus.

## Tasks

1. **Create Alertmanager Directory**: Ensures the `/etc/alertmanager` directory exists.
2. **Copy Alertmanager Configuration**: Transfers the `alertmanager.yml` file to `/etc/alertmanager/`.
3. **Copy Alertmanager Installation Script**: Transfers the `alertmanager.sh` script to `/tmp` and makes it executable.
4. **Run Installation Script**: Executes the `alertmanager.sh` script to install Alertmanager.
5. **Restart Prometheus**: Restarts Prometheus to apply the changes and enable Alertmanager integration.

## Usage

1. Place the following files in the playbook directory:
   - `alertmanager.yml`: Alertmanager configuration file.
   - `alertmanager.sh`: Script to install and set up Alertmanager.
2. Run the playbook:
   ```bash
   ansible-playbook -i inventory alertmanager.yml --become
   ```

## Notes

- Verify that the `alertmanager.yml` configuration file matches your alerting requirements.
- Ensure the `alertmanager.sh` script correctly installs Alertmanager in your environment.
- Check Prometheus service status after restarting:
  ```bash
  systemctl status prometheus
  ```
- The configuration file is stored in `/etc/alertmanager/`.

## Author

[Mohamed Eid](https://github.com/moeid404)
