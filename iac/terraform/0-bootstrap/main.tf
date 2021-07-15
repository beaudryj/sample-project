terraform {
  backend "s3" {}
}

data "aws_caller_identity" "current" {}
data "aws_partition" "current" {}

data "aws_iam_policy_document" "assume-role-open-policy" {
  statement {
    sid     = "AssumeRolePolicy"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}"]
    }
  }
}

data "aws_iam_policy_document" "assume-role-root-policy" {
  statement {
    sid     = "AssumeRolePolicy"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
  }
}

module "assume-role" {
  source              = "git@github.com:beaudryj/sample-iam-role-module.git"
  role_name           = "${var.suffix}-ci-role"
  assume_role_policy  = data.aws_iam_policy_document.assume-role-root-policy.json
  create_policy       = false
  existing_policy_arn = "arn:aws:iam::aws:policy/job-function/SupportUser"
}

module "group" {
  source             = "git@github.com:beaudryj/sample-iam-group-module.git"
  role_name          = "${var.suffix}-ci-group"
  assume_role_policy = data.aws_iam_policy_document.assume-role-root-policy.json
  create_policy      = true
  policy             = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "sts:AssumeRole"
      ],
      "Effect": "Allow",
      "Resource": "${module.assume-role.created-iam-role-arn}"
    }
  ]
}
EOF
  depends_on         = [module.assume-role]
}

module "user" {
  source              = "git@github.com:beaudryj/sample-iam-user-module.git"
  role_name           = "${var.suffix}-ci-user"
  assume_role_policy  = data.aws_iam_policy_document.assume-role-root-policy.json
  create_policy       = false
  existing_policy_arn = "arn:aws:iam::aws:policy/job-function/SupportUser"
}

resource "aws_iam_user_group_membership" "membership" {
  user = module.user.created-iam-user-name

  groups = [
    module.group.created-iam-group-name,
  ]

  depends_on = [module.group, module.user]
}