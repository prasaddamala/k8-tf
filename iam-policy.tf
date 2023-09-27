resource "aws_iam_policy" "alb_controller_policy" {
  name_prefix = "ALBControllerPolicy-"

  description = "IAM policy for AWS Load Balancer Controller"
  
  # Define the permissions for the policy
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = [
          "ec2:Describe*",
          "ec2:CreateSecurityGroup",
          "ec2:CreateTags",
          "ec2:AuthorizeSecurityGroupIngress",
          "ec2:RevokeSecurityGroupIngress",
        ],
        Effect   = "Allow",
        Resource = "*",
      },
      {
        Action   = [
          "elasticloadbalancing:CreateLoadBalancer",
          "elasticloadbalancing:DeleteLoadBalancer",
          "elasticloadbalancing:DescribeLoadBalancers",
          "elasticloadbalancing:ModifyLoadBalancerAttributes",
          "elasticloadbalancing:ModifyLoadBalancerAttributes",
        ],
        Effect   = "Allow",
        Resource = "*",
      },
      # Add more permissions as needed for your use case
    ],
  })
}

/* resource "aws_iam_role" "alb_controller_role" {
  name = "ALBControllerRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "eks.amazonaws.com" # Replace with the service that assumes this role (e.g., EKS)
        },
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "alb_controller_attachment" {
  policy_arn = aws_iam_policy.alb_controller_policy.arn
  role       = aws_iam_role.alb_controller_role.name
}
  */

