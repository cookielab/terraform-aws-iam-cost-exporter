data "aws_iam_policy_document" "assume" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = var.assumed_by_arn
    }
  }
}

resource "aws_iam_role" "this" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume.json

  tags = var.tags
}

data "aws_iam_policy_document" "this" {
  statement {
    effect = "Allow"
    actions = [
      "ce:GetCostAndUsage",
      "ce:GetDimensionValues",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "this" {
  name   = "cost-exporter"
  role   = aws_iam_role.this.name
  policy = data.aws_iam_policy_document.this.json
}
