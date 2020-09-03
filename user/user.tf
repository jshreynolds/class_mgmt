resource "aws_iam_user" "user" {
  name = var.username
  path = "/classusers/"
}

resource "aws_iam_access_key" "user" {
  user = aws_iam_user.user.name
}

data "aws_workspaces_bundle" "linux_value" {
  bundle_id = var.bundle_id
}

resource "aws_workspaces_workspace" "workspace" {
  directory_id = var.directory_id
  bundle_id    = data.aws_workspaces_bundle.linux_value.id
  user_name    = aws_iam_user.user.name

  workspace_properties {
    compute_type_name                         = "VALUE"
    user_volume_size_gib                      = 10
    root_volume_size_gib                      = 80
    running_mode                              = "AUTO_STOP"
    running_mode_auto_stop_timeout_in_minutes = 60
  }
  
  tags = {
    appleclass = "true"
  }
}

resource "aws_iam_user_policy_attachment" "elasticbeanstalk" {
  user       = aws_iam_user.user.name
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkFullAccess"
}

resource "aws_iam_user_policy_attachment" "codecommit" {
  user       = aws_iam_user.user.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeCommitFullAccess"
}

resource "aws_iam_user_policy_attachment" "iam" {
  user       = aws_iam_user.user.name
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

resource "aws_iam_user_policy_attachment" "codebuild" {
  user       = aws_iam_user.user.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess"
}

resource "aws_iam_user_policy_attachment" "codepipeline" {
  user       = aws_iam_user.user.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCodePipeline_FullAccess"
}

