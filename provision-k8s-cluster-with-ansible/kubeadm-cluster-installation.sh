#!/bin/bash

collect()
{
	nodes=()
	users=()

	i=0
	while true
	do
		if [ $i -eq 0 ]
		then
			read -p "Input master node IP: " nodes[$i]
		else
			read -p "Input node$i IP (Enter for none): " nodes[$i]
		fi

		if [ -z ${nodes[$i]} ]
		then
			if [ $i -ge 2 ]
			then
				echo "Skipping..."
				break
			else
				echo -e "\n\nError!"
				echo "At least 1 Master and 1 Worker node is reqiured for this installation."
				echo "Rerun the code when prerequisites are met!"
				echo "Exiting..."
				exit 1
			fi
		elif [[ ${nodes[$i]} =~ ^[1-9][0-9]{0,2}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]
		then
			while true
			do
				read -p "Input SSH username (Enter for root): " users[$i]

				if [ -z ${users[$i]} ]
                                then
					users[$i]="root"
				fi

				echo "Testing connection..."
				out=$( sshpass ssh -q ${users[$i]}@${nodes[$i]} exit && echo $? )

				if [ "$out" != "0" ]
				then
					echo "Server refused our SSH key!"
					echo "Copy ssh keys and rerun the script."
					echo "Exiting..."
					exit 1
				else
					echo -e "Success\n"
					break
				fi
			done
			
			i=$(( $i + 1 ))
		else
			echo "Not a valid IP!"
		fi
	done
}

ansible(){
	echo -e "\nGetting Ansible ready"
	cp /etc/ansible/hosts /etc/ansible/hosts.$( date +%m.%d.%y-%s )

	i=0
	for node in "${nodes[@]}"
	do
		if [ -n "$node" ]
		then
			if [ $i -eq 0 ]
			then
				echo -e "[kubernetes_master]\nmaster ansible_host=${nodes[$i]}\n" > /etc/ansible/hosts
			elif [ $i -eq 1 ]
			then
				echo -e "[kubernetes_nodes]\nnode$i ansible_host=${nodes[$i]}" >> /etc/ansible/hosts
			else
				echo -e "node$i ansible_host=${nodes[$i]}" >> /etc/ansible/hosts
			fi
		fi

		i=$(( $i + 1 ))
	done

	echo "/etc/ansible/hosts file was populated"
}

install_dependencies(){
	echo ""
	echo "##################################################"
	echo "Installing dependencies"
	echo "##################################################"

	ansible-playbook dependencies.yml
}

install_master(){
        echo ""
        echo "##################################################"
        echo "Configuring Master node"
        echo "##################################################"

	ansible-playbook master.yml 
}

install_workers(){
        echo ""
        echo "##################################################"
        echo "Configuring Worker nodes"
        echo "##################################################"

	ansible-playbook workers.yml 
}


echo "This script uses Ansible playbooks to install Kubernetes Cluster"
echo "* Review the code and use it at your own risk!"
echo -e "\nPrerequisites:"
echo -e "\tAt least 2 X CentOS 7 VMs"
echo -e "\twith 2 vCPUs, 2 GB of memory per each VM"
echo -e "\n\tSSH keys installed on all machines, on public IP"
echo -e "\n\tRun this script on Ansible machine!"
echo -e "\nDo you want to install Kubernetes Cluster?"
read -p "(y/n): " ans

if [[ $ans =~ ^[Yy]$ ]]
then
	sed -i /"StrictHostKeyChecking no"/d /etc/ssh/ssh_config
	sed -i s/"#   StrictHostKeyChecking ask"/"#   StrictHostKeyChecking ask\nStrictHostKeyChecking no"/ \
	/etc/ssh/ssh_config

	echo "Starting installation process..."
	if [ -z "$( rpm -qa | grep ansible )" ]
        then
                echo -e "\n\nError!"
                echo "It looks like Ansible is not installed on this machine."
                echo "Are you running the code on Ansible server?"
                read -p "(y/n): " ans

                if [[ $ans =~ ^[Yy]$ ]]
                then
                        echo "Great, should I proceed with installation of Ansible?"
                        read -p "(y/n): " ans

                        if [[ $ans =~ ^[Yy]$ ]]
                        then
                                yum install ansible -y > /dev/null

				collect
				ansible
				install_dependencies
				install_master
				install_workers
                        else
				echo "OK, rerun the code when Ansible is installed."
                                echo "Exiting..."
                        fi
                else
                        echo "Please run the script on Ansible server!"
                        echo "Exiting..."
                fi
        else
		collect
		ansible
		install_dependencies
		install_master
		install_workers
	fi
else
	echo "Exiting..."
fi

