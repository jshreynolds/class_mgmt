provider "aws" {
  region = "us-east-1"
}

module "user" {
    for_each = toset(var.usernames)
    source = "./user"
    username = each.value
    directory_id = var.directory_id
}

output "users" {
    value = module.user
}