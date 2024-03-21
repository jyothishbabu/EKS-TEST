terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      # version = "~> 4.15.0"
    }

    random = {
      source  = "hashicorp/random"
      # version = "3.1.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      # version = ">= 2.0.1"
    }

  }

# backend "remote" {
# 		hostname = "app.terraform.io"
# 		organization = "CloudQuickLabs"

# 		workspaces {
# 			name = "AWSEKS"
# 		}
# 	}
}


data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}
data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
provider "kubernetes" {
  cluster_ca_certificate = base64decode(module.eks.kubeconfig-certificate-authority-data)
  host                   = data.aws_eks_cluster.cluster.endpoint
  token                  = data.aws_eks_cluster_auth.cluster.token

}



provider "aws" {
  region = "us-east-1"
  access_key = "AKIAZYCG44VQVCEZ477C"
  secret_key = "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"
}

resource "random_string" "suffix" {
  length  = 5
  special = false
}

resource "aws_key_pair" "TestKeyPair" {
  key_name   = "TestKeyPair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
}
