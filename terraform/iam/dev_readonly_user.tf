# IAM user for developers
resource "aws_iam_user" "dev_readonly_user" {
  name = "dev-readonly"
  force_destroy = true
}

# Attach read-only access policy
resource "aws_iam_user_policy_attachment" "dev_readonly_policy" {
  user       = aws_iam_user.dev_readonly_user.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

# Access keys for CLI usage
resource "aws_iam_access_key" "dev_readonly_access_key" {
  user = aws_iam_user.dev_readonly_user.name
}
