provider "aws" {
  region = "us-east-1"
  profile = var.aws_profile
}

output "ssh_key_id" {
     value = aws_iam_user_ssh_key.git_ssh_key.ssh_public_key_id 
 }

 resource "aws_iam_user_ssh_key" "git_ssh_key" {
    username = var.aws_username
    encoding = "SSH"
    public_key = var.ssh_public_key
}


variable "aws_username" {
}

variable "ssh_public_key" {
}
