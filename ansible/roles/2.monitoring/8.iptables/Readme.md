# Ansible Task: IPTables Setup

This task installs the `iptables-persistent` package and applies custom iptables rules using a script.

## Tasks

1. **Install IPTables Persistent**: Ensures the `iptables-persistent` package is installed and updates the system package cache.
2. **Apply IPTables Rules**: Executes the `iptables.sh` script to apply custom iptables rules.

## Usage

1. Place the `iptables.sh` script in the same directory as your Ansible playbook.
2. Run the playbook:
   ```bash
   ansible-playbook -i inventory iptables.yml --become
   ```

## Notes
- The `iptables.sh` script should include all necessary rules and be compatible with your environment.
- Verify iptables rules after execution:
  ```bash
  iptables -L -v
  ```
- The `iptables-persistent` package ensures that rules persist after system reboots.

## Author

[Mohamed Eid](https://github.com/moeid404)
