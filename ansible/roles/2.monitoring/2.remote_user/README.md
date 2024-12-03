# Ansible Role: User Setup

This Ansible role sets up a user on a remote server with specific configurations, including creating an SSH directory, adding a public key to authorized keys, and granting sudo privileges.

## Role Tasks

This role performs the following tasks:

1. **Create User**: Creates a new user with the specified username, sets their shell to `/bin/bash`, assigns them to the `sudo` group, and creates a home directory.
2. **Create SSH Directory**: Creates an `.ssh` directory in the user's home directory.
3. **Add Public Key**: Copies the specified `id_rsa.pub` key to the user's `.ssh/authorized_keys` file.
4. **Update Sudoers File**: Grants the user passwordless sudo access by adding an entry to `/etc/sudoers`.

## Requirements

- The Ansible control node must have access to the public key (`id_rsa.pub`) that you want to copy to the remote server.
- Sudo privileges are required on the target server to make changes to `/etc/sudoers`.

## Role Variables

The following variables are required to run the role:

| Variable    | Description                          | Example     |
|-------------|--------------------------------------|-------------|
| `user_name` | The name of the user to be created.  | `johndoe`   |

## Example Playbook

```yaml
- hosts: all
  become: yes
  roles:
    - role: user_setup
      vars:
        user_name: johndoe
```

## Author

[Mohamed Eid](https://github.com/moeid404)