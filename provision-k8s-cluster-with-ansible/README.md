# kubernetes-ansible - Obsolete, use https://github.com/geerlingguy/ansible-role-kubernetes istead
How to create Kubernetes cluster with Ansible playbook
Prerequisites:
  - Centos 7
  - SSH Key 
  - Ansible
Before starting make sure that all prerequisites are met!  Also, don't forget to SSH to every machine you will be using with ansible.
Next create a directory: mkdir  ~/kubernetes
cd kubernetes > change directory to kubernetes
vi hosts > create file in kubernetes directory
copy and paste content from "hosts" repo into hosts file
enter ip's in worker and master section
vi dependencies.yml > create file in kubernetes directory and paste all the content with dependencies here
after run ansible-playbook -i hosts dependencies.yml
it will install all dependencies needed for kubernetes cluster
next we will be creatin master.yml and running
ansible-playbook -i hosts master.yml
now time to test master node
ssh centos@masterip
run: kubectl get nodes
you will be able to see the master node
after you made sure that master node is there. don't forget to exit
if you have problem ssh into centos user getting the wrong password error. Just reset the password by running passwd centos.
now time to set up workers
vi workers.yml paste the content form repo here and run ansible-playbook -i hosts workers.yml
this will add workers to the cluster
now ssh centos@master_ip
kubectl get nodes
to test that cluster works run:
kubectl run nginx --image=nginx --port 80 > will create the pod
kubectl get pods > to see the running pod
