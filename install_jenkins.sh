!/bin/bash

# Update package repositories
sudo apt-get update

# Install Java JDK 8
sudo apt-get install -y openjdk-8-jdk

# Install Maven
sudo apt-get install -y maven

# Install Git
sudo apt-get install -y git

# Install Docker engine
sudo apt-get update
sudo apt-get install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker

# Install Jenkins
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install -y jenkins

# Add Jenkins user to the docker group
sudo usermod -aG docker jenkins

# Start Docker and Jenkins services
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl start jenkins
sudo systemctl enable jenkins

