# Ansible Task: Node Exporter Installation

This task copies a Node Exporter installation script to the target server and executes it.

## Tasks

1. **Copy Installation Script**: Transfers the `install_node_exporter.sh` script to `/tmp` on the target server and makes it executable.
2. **Run Installation Script**: Executes the script to install Node Exporter.

## Usage

1. Place the `install_node_exporter.sh` script in the same directory as your Ansible playbook.
2. Run the playbook:
   ```bash
   ansible-playbook -i inventory node_exporter.yml --become
   ```

## Notes
- Ensure the `install_node_exporter.sh` script is correctly configured for your environment.
- Verify Node Exporter installation:
  ```bash
  systemctl status node_exporter
  ```
- The script is copied to `/tmp` and made executable with `0755` permissions.

## Author

[Mohamed Eid](https://github.com/moeid404)
