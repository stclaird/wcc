resource "helm_release" "prometheus-community" {
  name       = "kube-prometheus-stackr"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  namespace  = "monitoring"
  version = "45.28.1"

}
