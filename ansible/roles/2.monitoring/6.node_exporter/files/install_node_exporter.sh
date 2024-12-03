#!/bin/bash

# Script to install Node Exporter as a service

# 1. Add Node Exporter user with no shell
echo "Adding Node Exporter user..."
sudo useradd --no-create-home --shell /bin/false node_exporter

# 2. Download Node Exporter installation files
echo "Downloading Node Exporter..."
cd /tmp/
wget https://github.com/prometheus/node_exporter/releases/download/v1.8.0/node_exporter-1.8.0.linux-amd64.tar.gz

# 3. Extract Node Exporter files
echo "Extracting Node Exporter files..."
tar -xvf node_exporter-1.8.0.linux-amd64.tar.gz
cd node_exporter-1.8.0.linux-amd64

# 4. Move Node Exporter binary and set permissions
echo "Moving Node Exporter binary to /usr/local/bin/..."
sudo mv node_exporter /usr/local/bin/
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

# 5. Create Node Exporter systemd service file
echo "Creating Node Exporter service file..."
sudo tee /etc/systemd/system/node_exporter.service > /dev/null <<EOL
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOL

# 6. Reload systemd, start and enable Node Exporter service
echo "Reloading systemd and starting Node Exporter service..."
sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl status node_exporter
sudo systemctl enable node_exporter

echo "Node Exporter installation completed. It is running as a service."
