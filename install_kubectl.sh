!/bin/bash

# Add Kubernetes repository for Ubuntu
sudo sh -c 'cat <<EOF > /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF'

# Add GPG key for Kubernetes
sudo apt-get update && sudo apt-get install -y gnupg
sudo sh -c 'curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -'

# Install kubectl
sudo apt-get update && sudo apt-get install -y kubectl

# Install Armory Halyard
curl -L https://get.armory.io/halyard/install/latest/macos/InstallArmoryHalyard.sh > InstallArmoryHalyard.sh
sudo bash InstallArmoryHalyard.sh --version latest

