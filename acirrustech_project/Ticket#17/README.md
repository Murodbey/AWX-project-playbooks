# AWX Ticket#17

#### Create a playbook, that checks for kernel version every month, schedule it if new version comes up, sends alert to slack. Keep in mind playbooks can interact with slack channel

-------------------------------------------------------------------------------------------------------------

#### This playbook is scheduled to run every month, and it will go to every host and check if there is an available kernel update, if there is one it will send a notification to slack channel saying which host's kernel needs to be updated.
