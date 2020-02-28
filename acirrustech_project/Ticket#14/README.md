#AWX Ticket#14

Hi,

Create a playbook that takes 1 input
1. Link e.g (https://wordpress.org/latest.tar.gz) 

Downloads to any host, /tmp folder. Outputs that filename has been downloaded after playbook run

Thanks.

-------------------------------------------------------------------------------------------------------

##You will be using AWX/Ansible to run  playbook.


- This playbook will donwload Worpdress from provide e-link and unzip it to remote hosts

- It will ask to put input for e-link

* On your AWX specify branch to "team_A"

* Specify the variable link under "Extra Variables" 

* Add host IP 

* On your template be sure to select "ticket14/wp.yaml.yaml" and select "PROMPT ON LAUNCH"

* RUN your template job 