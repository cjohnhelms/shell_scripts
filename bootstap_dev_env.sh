#!/bin/bash

# System settings
hostnamectl set-hostname debiandev
dev=$(ip -br l | awk '$1 !~ "lo|vir|wl" { print $1}')
sed -i 's/dhcp/static/g' /etc/network/interfaces
echo "address   192.168.1.250" >> /etc/network/interfaces
echo "netmask   255.255.255.0" >> /etc/network/interfaces
echo "gateway   192.168.1.254" >> /etc/network/interfaces

# Add user to sudoers
usermod -aG sudo chris

# Install necessary and unessesary packages
apt install -y vim git

# Configure git
git config --global user.name "Chris Helms"
git config --global user.email "cjohnhelms@gmail.com"
git config --global core.editor "vim"

# Add windows system public key
mkdir /home/chris/.ssh
chown chris:chris /home/chris/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDOvdsuppxSNID6e+vsoS14vXm6INEGMsmj7KSwp5SzyWek/hYQS6D7OQL9X5bF0x6p4svbyv/ooNf0+gbWPZ3WBii7sltK4LslKk36lmGNL1P56eBvge01m/w+3K2l36xhRCxCTt438qRF7/JfaUqj6bSjLWxtWswwdF3jK400EwdF3yGigkW124EIzevSA5TBFo5mhvmia6Qw0GJeX0pNdaRTAXNtfp1nKgXGhWdzAAOLZ3Dnd/q6vR5HXxYLfCHkUZQisyAS1QFLdLeEaRtD5avK9gxjG4/2+txXnCj0o7qd8DHcDo6y5Nm+IQcDhwr0XbjmSAr2lDI5Vxc5K0tQTK93c5M4MUsMo/giKIPoND9+R3c1qdafTiifnhF5Wgi3fMKKXpu9VSq+ocUpQT37FGWiN+srZqGLmCBrLN+VtCdbdT3ml6x4iNmd0i8AzRuzvAQMWpJYXTsqfnST5OAnywJDPfe04a27V8MT0SfJYPcfu00NlX1SVKfzOjnEMJ8= cjohn@DESKTOP-BUNMAV0" > /home/chris/.ssh/authorized_keys

# Reboot the system
reboot
