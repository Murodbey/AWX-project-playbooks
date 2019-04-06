# AWX-ticket-12

##On AWX before running the job-template make sure you will add variables under "EXTRA VARIABLES"
```
---
group: wheel
user: ansible
userhome: /home/ansible
id_rsa_pub: content of the id_rsa.pub of the user which was provided by the user  him/herself
```

####- Make sure you have enabled option "PROMPT ON LAUNCH" of extra variables