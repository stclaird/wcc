# resource "helm_release" "nginx-ingress-controller" {
#   name       = "nginx-ingress-controller"
#   repository = "https://charts.bitnami.com/bitnami"
#   chart      = "nginx-ingress-controller"
#   namespace = "ingress-nginx"

#   set {
#     name  = "service.type"
#     value = "LoadBalancer"
#   }

#   set {
#     name  = "metrics.enabled"
#     value = "true"
#   }

#   set {
#     name = "controller.service.annotations.prometheus\\.io/scrape"
#     value=true
#   }

#   set {
#     name = "controller.service.annotations.prometheus\\.io/port"
#     value=10254
#   }

# }




