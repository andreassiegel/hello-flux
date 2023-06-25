resource "flux_bootstrap_git" "hello-flux" {
  depends_on = [
    # Flux needs to be installed before we can bootstrap anything
    helm_release.flux,

    # Deploy key needs to be added first
    github_repository_deploy_key.flux
  ]

  path = "clusters/my-cluster"
}
