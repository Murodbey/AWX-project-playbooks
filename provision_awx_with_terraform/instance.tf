provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "awx" {
  instance_type               = "t2.medium"
  ami                         = "ami-0ff760d16d9497662"
  key_name                    = "tower"
  associate_public_ip_address = "true"

  provisioner "file" {
    source      = "/tmp/provision_awx_tower/awx/"
    destination = "/tmp/"


    connection {
      host        = "${self.public_ip}"
      type        = "ssh"
      user        = "centos"
      private_key = "${file("/root/.ssh/tower.pem")}"
    }
  }
  provisioner "remote-exec" {
    connection {
      host        = "${self.public_ip}"
      type        = "ssh"
      user        = "centos"
      private_key = "${file("/root/.ssh/tower.pem")}"
    }
    inline = [
        "sudo yum install -y epel-release",
        "sudo yum install -y yum-utils device-mapper-persistent-data lvm2 ansible git python-devel python-pip python-docker-py vim-enhanced ",
        "sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo",
        "sudo yum install  docker-ce -y",
        "sudo systemctl start docker",
        "sudo systemctl enable docker",
        "sudo pip uninstall docker docker-py docker-compose",
        "sudo pip install docker-compose==1.9",
        "sudo ansible-playbook -i /tmp/awx/installer/inventory /tmp/awx/install.yml -vv",
      ]
   }
}
