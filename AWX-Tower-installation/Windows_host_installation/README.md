# AWX_windows_host_adding_steps_for_DUMMIES

* Create Windows(2016-2019) machine on aws with AWX key.
* Configure Security group by opening custom TCP port
[![](https://github.com/Murodbey/AWX-project/blob/master/Windows_host_installation/pictures/SG-configuration.JPG)]

## Steps on AWX master machine

* ssh into AWX machine, become root and install ptwinrm package into awx_task task container:

```python
docker container ls
docker exec -it awx_task /bin/bash
pip install ptwinrm
```
[![](https://github.com/Murodbey/AWX-project/blob/master/Windows_host_installation/pictures/install%20package%20on%20awx_task.JPG)]

* The same steps needs to be done on awx_web container:
```python
docker exec -it awx_web /bin/bash
pip install ptwinrm
```
[![](https://github.com/Murodbey/AWX-project/blob/master/Windows_host_installation/pictures/install%20package%20on%20awx_web.JPG)]

## Steps on Windows server:

* On AWS choose your Windows machine and connect to it. 
```
- Download Remote Desktop file
- Username: Administrator
[![](https://github.com/Murodbey/AWX-project/blob/master/Windows_host_installation/pictures/connecting%20into%20windows%20machine.JPG)]

- Password: you need to get Decrypt your password by adding the *.pem key into Key Pair path.
```

* Launch the Remote Desktop File which you have downloaded
```
- It will ask you for Username: Administrator
- It will ask you for Password: (we already got it)
```
[![](https://github.com/Murodbey/AWX-project/blob/master/Windows_host_installation/pictures/Decrypted%20pass%20example.JPG)]

* Once you are in the windows machine, follow these steps:
```
- Search for "Windows PowerShell ISE" On the search bar 
- Launch it and create new file
- Paste the script content init and run it.
- https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1
or
- you can get the script from the scirpt_for_windows.txt file
```
[![](https://github.com/Murodbey/AWX-project/blob/master/Windows_host_installation/pictures/Adding%20script%20using%20WPowerShell%20ISE.JPG)]

* Launch Windows Firewall with Advanced Security
```
- Choose inbound rules
- Add new rule
- Choose "Port" option and click "next"
- Choose "TCP" and Specify port number: 5985
- Allow all connections and click "next"
- Let it allow rule to everything
- And finally specify the name. For example: Windows http
```
[![](https://github.com/Murodbey/AWX-project/blob/master/Windows_host_installation/pictures/Configure%20firewall.JPG)]

 * Create another rule
```
- Choose inbound rules
- Add new rule
- Choose "Predefined" option and choose "Windows Remote Management" and click "next"
- You will have 2 rules, tick them and click "next"
- Allow the connection and "finish"
```

* Reboot the Windowsh Machine

## Import Windows host into AWX

* Inventory Steps
```
- Create new Invertory
- Add these details on AWX Inventories under "VARIABLES" and save it.
```

```python
ansible_port: 5986
ansible_connection: winrm
ansible_winrm_server_cert_validation: ignore
```
[![](https://github.com/Murodbey/AWX-project/blob/master/Windows_host_installation/pictures/adding%20variable%20on%20inventories.JPG)]

* Once you are done, go to hosts and add windows host
```
- Hostname: Win2016
- In the VARIABLES section add this >> ansible_host: IP(of the windows machine)
```
[![](https://github.com/Murodbey/AWX-project/blob/master/Windows_host_installation/pictures/adding%20ip.JPG)]


## Adding Credentials for Windows host

```
- Add new credentials
- Name: win_admin
- Credential type: Machine
- Username: Administrator
- Password: (the one which we already got it before logging into windowsh machine)
- Save it.
```
[![](https://github.com/Murodbey/AWX-project/blob/master/Windows_host_installation/pictures/windows%20Machine%20credentials.JPG)]

## Creating Project and Template

```
- First Create new project with SCM git. 
- Add url of the playbook repository on the github and save it.
```
[![](https://github.com/Murodbey/AWX-project/blob/master/Windows_host_installation/pictures/creating%20project.JPG)]

```
- Create new job-template
- Specify the name, inventory and project
- Choose which playbook it should run for testing: win_ping.yaml
- Choose win_admin credentials
- Save and run
```
[![](https://github.com/Murodbey/AWX-project/blob/master/Windows_host_installation/pictures/Template%20creating.JPG)]

## Playbook on github:

### https://github.com/Murodbey/AWX_windows_host_for_DUMMIES/blob/master/win_ping.yaml

[![](https://github.com/Murodbey/AWX-project/blob/master/Windows_host_installation/pictures/playbook%20to%20run%20ping%20job.JPG)]

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.


