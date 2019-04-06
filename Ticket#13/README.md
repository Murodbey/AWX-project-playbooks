#AWX Ticket#13

Hi,
Need a playbook which takes 4 input from user. 
1. IP of the DB host
2. DB folder location  (usually /var/lib/mysql)

3. IP of the Backup server (can be just linux machine different from DB) 
4. /backups folder (can be any location.)


User should be able to execute and take a backup of DB and send the backup to another host. Playbook should zip first and send the zipped backup folder across the internet
 -----------------------------------------------------------------------------------------------------------

 ##The playbook has the following steps: 



1. Ping the host 

2. Archive the database under /tmp and time-stamp the file name

3. Once the archive is done, sends the file to backupserver, to a specified folder. 

You need to provide the following variables. 


```
dbhost:

dbname:

backuphost: 

backupfolder:
```