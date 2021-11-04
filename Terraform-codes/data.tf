data "aws_caller_identity" "current" {}


data "aws_eks_cluster" "cortex_demo_eks" {
  name = var.cluster_name
}

data "template_file" "cortex_demo_s3_trust_relationship" {
  template = file("${path.module}/policies/cortex-demo-s3-trust-relationship.json.tpl")

  vars = {
    account_id		= data.aws_caller_identity.current.account_id
    oidc		= trimprefix(data.aws_eks_cluster.cortex_demo_eks.identity.0.oidc.0.issuer, "https://")
    namespace		= var.namespace
    serviceaccount	= var.serviceaccount
  }
}

data "template_file" "cortex_demo_s3_iam_policy" {
  template = file("${path.module}/policies/cortex-demo-s3-iam-policy.json.tpl")

  vars = {
    cortex_bucket_arn = aws_s3_bucket.cortex_demo_s3.arn
  }
}
