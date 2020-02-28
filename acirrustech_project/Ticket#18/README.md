#AWX Ticket#18

- Playbook needed to change ssh port to 8875. 
- Playbook must take input from user for host and port. In the mean time, it opens port security group. Once - playbook runs it should tell me it can telnet to ssh port. 

-------------------------------------------------------------------------------------------------------------

###On AWS manage the security group which was attached to hosts

#####You will need to add:
  - Custom TCP rule with port number which you want
  - Specify source: anywhere

###On AWX before running the job-template make sure you will add variables under "EXTRA VARIABLES"

```
---
host: IP or hostname         example: all or ipaddr or centos
port_line: Port ##              example: "Port 8875"
port: port number             example: "8875"
protocol: give protocol name    example: "TCP"
```

* Make sure you have enabled option "PROMPT ON LAUNCH" of extra variables

###In the host machine please run the following command to see current ssh port:
```
sudo netstat -tlnp | grep ssh
```