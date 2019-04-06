# AWX-ticket-12

Please create interactive playbook, where I can pass 2 parameters: 
1. username
2. ssh-pub key

It should add to ansible user on all remote systems. If ansible user is not added please add it. Next thing is to make sure ansible use is part of wheel group, where I can run sudo command and install necessary packages

##On AWX before running the job-template make sure you will add variables under "EXTRA VARIABLES"
```
---
group: wheel
user: ansible
userhome: /home/ansible
id_rsa_pub: content of the id_rsa.pub of the user which was provided by the user  him/herself
```

####- Make sure you have enabled option "PROMPT ON LAUNCH" of extra variables