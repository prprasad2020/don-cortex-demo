resource "aws_iam_role" "cortex_demo_s3_access" {
  name = "cortex-demo-s3-access"

  assume_role_policy = data.template_file.cortex_demo_s3_trust_relationship.rendered
}

resource "aws_iam_policy" "cortex_demo_s3_policy" {
  name = "cortex-demo-s3-policy"

  policy = data.template_file.cortex_demo_s3_iam_policy.rendered
}

resource "aws_iam_role_policy_attachment" "cortex_demo_s3" {
  role       = aws_iam_role.cortex_demo_s3_access.name
  policy_arn = aws_iam_policy.cortex_demo_s3_policy.arn
}
