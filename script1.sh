#!/bin/bash

VM1=vm1-av
VM2=vm2-av
VM3=vm3-av
usr="$(whoami)"
ssh $usr@$VM2 "sudo sed -i '/Port/s/22/23/' /etc/ssh/sshd_config | sudo sed -i '/Port/s/#/''/' /etc/ssh/sshd_config"
ssh $usr@$VM2 "sudo firewall-cmd --zone=public --add-port=23/tcp --permanent"
ssh $usr@$VM2 "sudo firewall-cmd --reload"
ssh $usr@$VM2 "sudo systemctl restart sshd.service"
echo "SSH for VM2 configured on port 22"
ssh $usr@$VM3 "sudo sed -i '/Port/s/22/24/' /etc/ssh/sshd_config | sudo sed -i '/Port/s/#/''/' /etc/ssh/sshd_config"
ssh $usr@$VM3 "sudo firewall-cmd --zone=public --add-port=24/tcp --permanent"
ssh $usr@$VM3 "sudo firewall-cmd --reload"
ssh $usr@$VM3 "sudo systemctl restart sshd.service"
echo "SSH for VM3 configured on port 24"
ssh $usr@$VM3 -p 24 "sudo sed -i '/PermitRootLogin/s/no/yes/' /etc/ssh/sshd_config | sudo sed -i '/PermitRootLogin/s/#/''/' /etc/ssh/sshd_config"
ssh $usr@$VM3 -p 24 "sudo firewall-cmd --direct --add-rule ipv4 filter INPUT 1 -m tcp --source $VM1 -p tcp --dport 24 -j REJECT"

