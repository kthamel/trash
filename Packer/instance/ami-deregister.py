#!/usr/bin/python3

import subprocess

ami_ids = "ami_list.txt"
cmd_dereg = "aws ec2 deregister-image --image-id "

def function_ami_deregister():
    with open(ami_ids, "r") as rfile:
        for line in rfile:
            subprocess.run(cmd_dereg + line, shell=True, check=True)

function_ami_deregister()
