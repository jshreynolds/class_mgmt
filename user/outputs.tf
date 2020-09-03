output "name" {
    value = aws_iam_user.user.name
}

output "secret" {
  value = aws_iam_access_key.user.secret
}

output "access_key_id" {
    value = aws_iam_access_key.user.id
}

output "workspace_id" {
    value = aws_workspaces_workspace.workspace.id
}

output "registration_code" {
    value = data.aws_workspaces_directory.workspaces_dir.registration_code
}