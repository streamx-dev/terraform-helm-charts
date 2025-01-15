terraform {
  required_version = ">= 1.8.1"
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.17.0"
    }
  }
}