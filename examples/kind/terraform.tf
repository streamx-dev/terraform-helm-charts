terraform {
  required_version = ">= 1.8.1"
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "~> 0.7.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1.14.0"
    }
  }
}