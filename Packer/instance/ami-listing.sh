#!/bin/bash

aws ec2 describe-images --filters "Name=name,Values=kthamel-ami-*" --query 'Images[*].[ImageId]' --output text > ami_list.txt
