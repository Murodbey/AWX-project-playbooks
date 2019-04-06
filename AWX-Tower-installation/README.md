# What is Ansible Tower?

Ansible Tower (formerly ‘AWX’) is a web-based solution that makes Ansible even more easy to use for IT teams of all kinds. It’s designed to be the hub for all of your automation tasks.

Tower allows you to control access to who can access what, even allowing sharing of SSH credentials without someone being able to transfer those credentials. Inventory can be graphically managed or synced with a wide variety of cloud sources. It logs all of your jobs, integrates well with LDAP, and has an amazing browsable REST API. Command line tools are available for easy integration with Jenkins as well. Provisioning callbacks provide great support for autoscaling topologies.

Find out more about Tower features and how to download it on the Ansible Tower webpage. Tower is free for usage for up to 10 nodes, and comes bundled with amazing support from Ansible, Inc. As you would expect, Tower is installed using Ansible playbooks!

# Script Link for easy installation.


### https://github.com/azaa1/awx-installation





## Creating and Configuring machine on AWS 

1. First you need to create Centos machine. You can find ready Centos ami instance from aws marketplace.
[![](https://github.com/Murodbey/AWX-project/blob/master/AWX-Tower-installation/pictures/aws-marketplace.PNG)]

2. Once you chose Centos7, you will be required to choose instance type. For Ansible-Tower you will need at least t2.medium instance. 

[![](https://github.com/Murodbey/AWX-project/blob/master/AWX-Tower-installation/pictures/t2.medium.PNG)]

3. To access your AWX on the browser, you will need to open port 80 in the security group configuration. You can configure it before launching instance. You may want to choose existing Security Group or create new one.

[![](https://github.com/Murodbey/AWX-project/blob/master/AWX-Tower-installation/pictures/SecurityGroup.PNG)]

4. Before launching instance you will need to create new key or use existing key. Make sure to download the key. Otherwise you won`t be able to ssh into your machine.

[![](https://github.com/Murodbey/AWX-project/blob/master/AWX-Tower-installation/pictures/Key-pair.PNG)]

5. Once the instance is created, you need to attach IAM role with full Admin access to that instance.

[![](https://github.com/Murodbey/AWX-project/blob/master/AWX-Tower-installation/pictures/attaching%20iam%20role.PNG)]

6. To ssh into machine run this command(make sure to use "centos" user):

```python
cd ~/Downloads
ssh -i Ansible-tower.pem centos@IP
```
[![](https://github.com/Murodbey/AWX-project/blob/master/AWX-Tower-installation/pictures/ssh%20into%20machine.PNG)]


## AWX Installation

1. Please run following commands:

```python
sudo su -
yum install -y epel-release 
yum install -y yum-utils device-mapper-persistent-data lvm2 ansible git python-devel python-pip python-docker-py vim-enhanced 
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo 
yum install docker-ce -y 
systemctl start docker 
systemctl enable docker 
git clone https://github.com/ansible/awx.git 
cd awx  
git clone https://github.com/ansible/awx-logos.git 
cd installer/
vim inventory 
```
inside inventory file make proper changes on the following lines. Some of them needs to be enabled
by removing "#" and replace keywords.

```python
postgres_data_dir=/var/lib/pgdocker 
awx_official=true 
project_data_dir=/var/lib/awx/projects 
```

once you have changed those lines, save and quit. Run the following commands:

```python
ansible-playbook -i inventory install.yml -vv 

docker container ls
```
[![](https://github.com/Murodbey/AWX-project/blob/master/AWX-Tower-installation/pictures/docker%20container%20ls.PNG)]

2. Once installation is completed, get the public IP of your instance and paste it to the browser. You will be able to see your AWX login page on the browser

[![](https://github.com/Murodbey/AWX-project/blob/master/AWX-Tower-installation/pictures/awx%20login%20page.PNG)]

3. Default Login and Password for AWX

```python
admin = admin
password = password
```

## Possible ERRORS.

1. When you run the following command: 

```python
ansible-playbook -i inventory install.yml -vv 
```

you might get docker-compose issue. It will ask you to install docker-compose. 

```python
pip install docker-compose
ansible-playbook -i inventory install.yml -vv
```

2. Even after installation of docker-compose it complains about docker and docker-py, you need to run the following command:
```python
pip install --ignore-installed docker
ansible-playbook -i inventory install.yml -vv
``` 

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update toolss as appropriate.
