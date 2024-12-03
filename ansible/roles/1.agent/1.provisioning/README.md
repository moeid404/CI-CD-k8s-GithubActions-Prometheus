# Package Installation Role

This role ensures that essential packages are installed on the target server.

## Tasks Overview

### 1. Update APT Repository
- Updates the APT package index to ensure the latest package information is available.

### 2. Install Required Packages
- Installs a list of essential packages on the remote server, including:
  - `rsync`
  - `procps`
  - `vim`
  - `net-tools`

## Usage

1. Modify the package list if additional packages are needed.
2. Include this role in your playbook.
3. Run the playbook with the appropriate command to install the packages.

## Author

[Mohamed Eid](https://github.com/moeid404)