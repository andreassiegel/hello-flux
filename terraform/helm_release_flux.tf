resource "null_resource" "helm_repo_init" {
  provisioner "local-exec" {
    command = "helm repo add fluxcd-community https://fluxcd-community.github.io/helm-charts"
  }

  provisioner "local-exec" {
    command = "helm repo update fluxcd-community"
  }
}

resource "helm_release" "flux" {
  depends_on = [
    # helm repo needs to be added before we can install a chart from it
    null_resource.helm_repo_init
  ]

# for some reason the chart is not found when using the repository this way,
# therefore, it is added "locally" using helm repo commands via the null_resource above
#  repository       = "https://fluxcd-community.github.io/helm-charts"
  chart            = "fluxcd-community/flux2"
  name             = "flux2"
  namespace        = "flux-system"
  create_namespace = true
}
