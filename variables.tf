variable "region" {
  default = "us-west-2"
}

variable "os_name" {
  default = "ami-0ccea833bf267252a"
}

variable "key" {
  default = "kubernet"
}

variable "instance-type" {
  default = "t2.micro"
}

variable "vpc-cidr" {
  default = "10.10.0.0/16"
  }

variable "subnet1-cidr" {
  default = "10.10.2.0/24"

}

variable "subnet2-cidr" {
  default = "10.10.3.0/24"

}
variable "subent-1_az" {
  default = "us-west-2a"
}

variable "subent-2_az" {
  default = "us-west-2b"
}

variable "policy_name" {
  type        = string
  description = "IAM policy name (must be unique for whole account)"
  default     = "AmazonEKSLoadbalancerController"
}

variable "role_name" {
  type        = string
  description = "IAM role name (must be unique for whole account)"
  default     = "AmazonEKSLoadbalancerController"
}

variable "oidc_assume_role_arn" {
  type        = string
  description = "IAM OIDC provider arn (eg. aws_iam_openid_connect_provider.default.arn)"
  default = null
}

variable "ec2_role_name" {
  type        = string
  description = "EC2 IAM role name (eg. aws_iam_role.default_eks_node_group.name)"
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}


variable "eks_cluster_name" {
  default="ed-eks-01"
}

