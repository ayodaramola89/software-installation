#!/bin/bash
# USE THIS SCRIPT TO INSTALL TOMCAT IN REDHAT SERVERS
echo delete the failed version of tomcat
sudo rm -rf /opt/tomcat9
echo assign a hostname to your server 
sudo hostname tomcat-server
# install Java JDK 1.8+ as a pre-requisit for tomcat to run.
cd /opt 
sudo yum install git wget unzip -y
sudo yum install java-1.8.0-openjdk-devel -y
# Download tomcat software and extract it.

sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.64/bin/apache-tomcat-9.0.64.tar.gz
sudo tar -xvf apache-tomcat-9.0.64.tar.gz
sudo rm apache-tomcat-9.0.64.tar.gz
sudo mv apache-tomcat-9.0.64 tomcat9
sudo chmod 777 -R /opt/tomcat9
sudo chown ec2-user -R /opt/tomcat9
sh /opt/tomcat9/bin/startup.sh
# create a soft link to start and stop tomcat
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat
sudo yum update -y
starttomcat
echo "end on tomcat installation"
