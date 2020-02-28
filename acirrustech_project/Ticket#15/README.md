#AWX Ticket#15

Hi,

Create a playbook, that takes 1 input which is IP or hostname
0. Outputs kernel version of 1 host
1. Fully updates remote system
2. restarts remote system
3. Waits till it comes back online 
4. Outputs the latest kernel version 

Thanks

-------------------------------------------------------------------------------------------------------------

###The follow documentation will update everything in your host including kernel.
####You will be using AWX/Ansible to do full update

##### Warning, currently this playbook is only supporting Centos. Use it at your own risk #########

* Specify the variable hostname under "Extra Variables"

* On your template be sure to select "patching.yaml" and celect "PROMPT ON LAUNCH"

* RUN your template job and hope for the best!