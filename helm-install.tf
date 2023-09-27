 resource "helm_release" "aws-load-balancer-controller" {
  name       = "aws-load-balancer-controller"
  namespace  = "kube-system"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  version    = "1.5.0"  # Replace with the desired chart version
  timeout    =  "900"
  set {
    name  = "clusterName"
    value = "ed-eks-01"
  }

  set {
    name  = "serviceAccount.create"
    value = "false"
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }
} 

 
/* resource "helm_release" "aws_alb_controlle" {
  depends_on = [var.mod_dependency, kubernetes_namespace.alb_controller]
  count      = var.enabled ? 1 : 0
  name       = var.helm_chart_name
  chart      = var.helm_chart_release_name
  repository = var.helm_chart_repo
  version    = var.helm_chart_version
  namespace  = var.namespace

  set {
    name  = "clusterName"
    value = var.cluster_name
  }

  set {
    name  = "awsRegion"
    value = var.aws_region
  }

  set {
    name  = "rbac.create"
    value = "true"
  }

  set {
    name  = "serviceAccount.create"
    value = "true"
  }

  set {
    name  = "serviceAccount.name"
    value = var.service_account_name
  }

  /* set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.kubernetes_alb_controller[0].arn
  } 

  set {
    name  = "enableServiceMutatorWebhook"
    value = "false"
  }

  values = [
    yamlencode(var.settings)
  ]

} */
 
/* resource "null_resource" "install_aws_lb_controller" {
  provisioner "local-exec" {
    command = <<-EOT
      helm repo add eks https://aws.github.io/eks-charts

      # Update your local Helm chart repository
      helm repo update

      # Create a namespace for the AWS Load Balancer Controller
      kubectl create namespace aws-load-balancer-controller

      # Install the AWS Load Balancer Controller using Helm
      helm install aws-load-balancer-controller \
        eks/aws-load-balancer-controller \
        -n aws-load-balancer-controller \
        --set clusterName=${var.eks_cluster_name} \
        --set serviceAccount.create=false \
        --set serviceAccount.name=aws-load-balancer-controller \
        --set region=${var.region} \
        --set vpcId=${var.vpc-cidr} \
        
    EOT
  }
}  */

# Trigger the execution of the installation when the variables change
/* resource "aws_instance" "example" {
  ami           = "ami-0f3769c8d8429942f"
  instance_type = "t2.micro"

  # ...

  /* triggers = {
    aws_lb_controller_version = var.aws_lb_controller_version
  } */
 

