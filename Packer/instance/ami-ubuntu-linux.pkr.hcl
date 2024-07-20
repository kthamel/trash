packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
  }
}

source "amazon-ebs" "ami-ubuntu-linux" {
  ami_name      = "kthamel-ami-ubuntu-linux"
  instance_type = "t2.micro"
  region        = "us-east-2"
  source_ami    = "ami-03bfe38a90ce33425"
  ssh_username  = "ubuntu"
}

build {
  name    = "build-ami-ubuntu-linux"
  sources = ["source.amazon-ebs.ami-ubuntu-linux"]

  provisioner "shell" {
    inline = [
      "sudo apt-get update -y"
    ]
  }
}
