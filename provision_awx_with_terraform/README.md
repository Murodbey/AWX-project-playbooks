# Steps to install awx tower. 
## This documentation is for Ireland region only. 

Prerequisites
1. Install terraform
2. setup IAM role or access key and secret key to access AWS
3. Upload public key of root user to aws under ireland region with the name of "tower"
4. rename id_rsa.pub of root user to tower.pem
5. chmod 400 /root/.ssh/tower.pem
6. Clone repo to /tmp/
7. become root user
8. run terraform apply


# If for some reason file provision does not work, please open port 22 and 80 on security group



Creating instances in different regions.1
1. Import pub key to all regions
