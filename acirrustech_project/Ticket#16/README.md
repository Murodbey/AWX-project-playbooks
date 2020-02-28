#AWX Ticket#16

#####Create a playbook, that searches for users that are not active for 90 days and disables them, in the meantime takes a backup of their home directory. Schedule this playbook to run accordingly

----------------------------------------------------------------------------------------------------------

#####This playbook will go to hosts and search for the users that weren't active for the last 90 days, then it will deactivate them and archive their home directory