#!/bin/bash

# Atualizar a lista de pacotes
sudo yum update -y

# Instalar o repositório EPEL
sudo amazon-linux-extras install epel -y

# Instalar o OpenJDK 11 (pode ajustar para a versão desejada)
sudo amazon-linux-extras install java-openjdk11 -y

# Definir JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-$(uname -i)

# Adicionar JAVA_HOME ao PATH
echo 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-$(uname -i)' >> ~/.bashrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc

# Aplicar as mudanças no bashrc
source ~/.bashrc

# Adicionar repositório do Jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key

# Instalar o Jenkins
sudo yum install -y jenkins

# Iniciar e habilitar o serviço Jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Verificar status do Jenkins
sudo systemctl status jenkins

echo "JDK, JRE e Jenkins instalados com sucesso!"