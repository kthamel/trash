packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
  }
}

source "amazon-ebs" "ami-amazon-linux" {
  ami_name      = "kthamel-ami-amazon-linux"
  instance_type = "t2.micro"
  region        = "us-east-2"
  source_ami    = "ami-0649bea3443ede307"
  ssh_username  = "ubuntu"
}

build {
  name    = "build-ami-amazon-linux"
  sources = ["source.amazon-ebs.ami-amazon-linux"]

  provisioner "shell" {
    inline = [
      "sudo apt-get update -y"
    ]
  }
}
