resource "aws_instance" "jenkins-instance" {
  ami           = "ami-0d18e50ca22537278"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet_1.id
  key_name      = "your-key-pair-name"  # Add this line with your key pair name

  user_data = file("/home/cloudshell-user/jenkins-project/terraform-infra/install_jenkins.sh")

// Other configuration for jenkins_instance
}


resource "aws_instance" "kube-master" {
  ami           = "ami-0d18e50ca22537278"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet_2.id

  user_data = file("/home/cloudshell-user/jenkins-project/terraform-infra/install_kubectl.sh")

  // Other configuration for kube_master
}


resource "aws_instance" "kube-worker" {
  ami           = "ami-0d18e50ca22537278"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet_1.id
  
  user_data = file("/home/cloudshell-user/jenkins-project/terraform-infra/install_kubectl.sh")

  // Other configuration for kube_worker
}


