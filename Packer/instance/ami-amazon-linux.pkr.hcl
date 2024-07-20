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
  ssh_username  = "ec2-user"
}

build {
  name    = "build-ami-amazon-linux"
  sources = ["source.amazon-ebs.ami-amazon-linux"]

  provisioner "shell" {
    inline = [
      "sudo yum update -y",
      "sudo yum install nginx -y",
      "sudo systemctl enable nginx.service",
      "sudo systemctl start nginx.service"
    ]
  }
}
