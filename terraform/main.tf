resource "aws_security_group" "agent_sg" {
  name        = "agent_sg"
  description = "Allow inbound traffic for Agent"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "prometheus_sg" {
  name        = "prometheus_sg"
  description = "Allow inbound traffic for Prometheus Server"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "agent" {
  ami             = "ami-0e86e20dae9224db8" # Ubuntu AMI (modify for your region)
  instance_type   = var.instance_type
  key_name        = var.ssh_key_name
  security_groups = [aws_security_group.agent_sg.name]

  tags = {
    Name        = "agent-server"
    Environment = "production" # Added to filter instances for GitHub Actions
    Role        = "agent"
  }

}

resource "aws_instance" "prometheus" {
  ami             = "ami-0e86e20dae9224db8"
  instance_type   = var.instance_type
  key_name        = var.ssh_key_name
  security_groups = [aws_security_group.prometheus_sg.name]

  tags = {
    Name        = "prometheus-server"
    Environment = "production" # Added to filter instances for GitHub Actions
    Role        = "prometheus"
  }
}

# Outputs for the agent instance
output "agent_public_ip" {
  value = aws_instance.agent.public_ip
  description = "Public IP of the agent server"
}

# Outputs for the Prometheus server
output "prometheus_public_ip" {
  value = aws_instance.prometheus.public_ip
  description = "Public IP of the Prometheus server"
}