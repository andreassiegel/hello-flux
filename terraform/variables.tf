variable "github_organization" {
  type = string
  description = "Name of the GitHub organization to use for Flux"
}

variable "github_repository" {
  type = string
  description = "Name of the repository to use for Flux"
}

variable "github_token" {
  type = string
  description = "The personal access token for GitHub"
}

variable "kubernetes_context" {
  type = string
  description = "The name of the Kubernetes context to use for Flux"
}
