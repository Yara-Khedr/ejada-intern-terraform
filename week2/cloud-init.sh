#!/bin/bash
yum install -y nfs-utils httpd
mkdir -p /mnt/appdata
mount -o nosuid,resvport,sec=sys ${mount_target_ip}:${export_path} /mnt/appdata
echo "${mount_target_ip}:${export_path} /mnt/appdata nfs nosuid,resvport,sec=sys,nofail 0 0" >> /etc/fstab
echo "<h1>Yara Week 2 - App running on private instance, FSS mounted successfully</h1>" > /var/www/html/index.html
firewall-cmd --permanent --add-service=http
firewall-cmd --reload
systemctl enable httpd
systemctl start httpd