# What is Ansible Tower?

Ansible Tower (formerly ‘AWX’) is a web-based solution that makes Ansible even more easy to use for IT teams of all kinds. It’s designed to be the hub for all of your automation tasks.

Tower allows you to control access to who can access what, even allowing sharing of SSH credentials without someone being able to transfer those credentials. Inventory can be graphically managed or synced with a wide variety of cloud sources. It logs all of your jobs, integrates well with LDAP, and has an amazing browsable REST API. Command line tools are available for easy integration with Jenkins as well. Provisioning callbacks provide great support for autoscaling topologies.

Find out more about Tower features and how to download it on the Ansible Tower webpage. Tower is free for usage for up to 10 nodes, and comes bundled with amazing support from Ansible, Inc. As you would expect, Tower is installed using Ansible playbooks!

-------------------------------------------------------------------------------------------------------------

# Ticket#10
Create the following playbooks
- install vim on CentOS7, Ubuntu and Debian
- install tree and telnet on CentOS7, Ubuntu and Debian
- zip files that are older then 90 days (Linux Machines)
- zip files that are over 2GB (Linux Machines)

# Ticket#11
Please create the follow playbooks: 
- Playbook that starts and stops service
- Add User ssh keys to remote systems
- Create playbook for adding a user and getting it's ssh key to authorized keys of another systems
- Create playbook to update route53 create and delete entries in route53
Please make sure these are pushed to your own branches, and include nice README file

# Ticket#12
Please create interactive playbook, where I can pass 2 parameters: 
1. username
2. ssh-pub key

It should add to ansible user on all remote systems. If ansible user is not added please add it. Next thing is to make sure ansible use is part of wheel group, where I can run sudo command and install necessary packages

# Ticket#13
Need a playbook which takes 4 input from user. 
1. IP of the DB host
2. DB folder location  (usually /var/lib/mysql)
3. IP of the Backup server (can be just linux machine different from DB) 
4. /backups folder (can be any location.)

User should be able to execute and take a backup of DB and send the backup to another host. Playbook should zip first and send the zipped backup folder across the internet


# Ticket#14
Create a playbook that takes 1 input
1. Link e.g (https://wordpress.org/latest.tar.gz) 

Downloads to any host, /tmp folder. Outputs that filename has been downloaded after playbook run

# Ticket#15
Create a playbook, that takes 1 input which is IP or hostname
0. Outputs kernel version of 1 host
1. Fully updates remote system
2. restarts remote system
3. Waits till it comes back online 
4. Outputs the latest kernel version 

# Ticket#16
Create a playbook, that searches for users that are not active for 90 days and disables them, in the meantime takes a backup of their home directory. Schedule this playbook to run accordingly

# Ticket#17
Create a playbook, that checks for kernel version every month, schedule it if new version comes up, sends alert to slack. Keep in mind playbooks can interact with slack channel

# Ticket#18
Playbook needed to change ssh port to 8875. 
Playbook must take input from user for host and port. In the mean time, it opens port security group. Once playbook runs it should tell me it can telnet to ssh port. 