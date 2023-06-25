terraform {
  required_version = ">=1.3.0"

  backend "local" {}

  required_providers {
    flux = {
      source = "fluxcd/flux"
      version = "1.0.0-rc.5"
    }

    github = {
      source  = "integrations/github"
      version = ">=5.28.1"
    }

    helm = {
      source = "hashicorp/helm"
      version = "2.10.1"
    }
  }
}

provider "github" {
  base_url = "https://api.github.com/"
  owner = var.github_organization
  token = var.github_token
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }

  experiments {
    manifest = true
  }
}

provider "flux" {
  kubernetes = {
    config_path = "~/.kube/config"
    config_context = var.kubernetes_context
  }
  git = {
    url = "ssh://git@github.com/${var.github_organization}/${var.github_repository}.git"
    ssh = {
      username = "git"
      private_key = tls_private_key.flux.private_key_pem
    }
  }
}
