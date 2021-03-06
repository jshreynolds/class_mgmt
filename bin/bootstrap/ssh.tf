provider "aws" {
  region = "us-east-1"
}

output "ssh_key_id" {
     value = aws_iam_user_ssh_key.git_ssh_key.ssh_public_key_id 
 }

 resource "aws_iam_user_ssh_key" "git_ssh_key" {
    username = var.aws_profile
    encoding = "SSH"
    public_key = var.ssh_public_key
}


variable "aws_profile" {
}

variable "ssh_public_key" {
}
