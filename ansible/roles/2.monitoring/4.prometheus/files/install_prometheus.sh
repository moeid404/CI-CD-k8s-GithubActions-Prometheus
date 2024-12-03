#!/bin/bash

# Script to install Prometheus as a service

# 1. Add Prometheus user with no shell
echo "Adding Prometheus user..."
sudo useradd --no-create-home --shell /bin/false prometheus

# 2. Create Prometheus configuration directories
echo "Creating Prometheus configuration directories..."
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus

# 3. Set ownership of the library directory
echo "Setting ownership for Prometheus library directory..."
sudo chown prometheus:prometheus /var/lib/prometheus

# 4. Download Prometheus installation files
echo "Downloading Prometheus..."
cd /tmp/
wget https://github.com/prometheus/prometheus/releases/download/v2.52.0/prometheus-2.52.0.linux-amd64.tar.gz

# 5. Extract Prometheus files
echo "Extracting Prometheus files..."
tar -xvf prometheus-2.52.0.linux-amd64.tar.gz
cd prometheus-2.52.0.linux-amd64

# 6. Move configuration files to /etc/prometheus
echo "Moving Prometheus configuration files..."
sudo mv console* /etc/prometheus
sudo mv prometheus.yml /etc/prometheus
sudo chown -R prometheus:prometheus /etc/prometheus

# 7. Move binary files to /usr/local/bin and set ownership
echo "Moving Prometheus binary files..."
sudo mv prometheus /usr/local/bin/
sudo mv promtool /usr/local/bin/
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool

# 8. Create Prometheus service file
echo "Creating Prometheus service file..."
sudo tee /etc/systemd/system/prometheus.service > /dev/null <<EOL
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \
--config.file /etc/prometheus/prometheus.yml \
--storage.tsdb.path /var/lib/prometheus/ \
--web.console.templates=/etc/prometheus/consoles \
--web.console.libraries=/etc/prometheus/console_libraries

[Install]
WantedBy=multi-user.target
EOL

# 9. Reload systemd, start and enable Prometheus service
echo "Reloading systemd and starting Prometheus service..."
sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl status prometheus
sudo systemctl enable prometheus

echo "Prometheus installation completed. It is running on port 9090."
